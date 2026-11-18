import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';

const _navy = Color(0xFF0B1D3A);
const _blue = Color(0xFF1D4ED8);
const _green = Color(0xFF2E7D32);
const _red = Color(0xFFE53935);
const _orange = Color(0xFFF59E0B);
const _ink = Color(0xFF14213D);
const _muted = Color(0xFF5B6478);
const _line = Color(0xFFE3E8F2);

/// Durée indicative entre la demande urgente et l'arrivée du technicien.
const Duration kUrgentEta = Duration(minutes: 90);

/// Étapes du suivi, dans l'ordre.
enum _Step { received, searching, assigned, onTheWay, onSite, done }

/// Page de suivi complète d'une demande (client sans compte), à partir
/// du jeton reçu à la création. Se met à jour toute seule toutes les 30 s.
class RequestTrackingView extends StatefulWidget {
  const RequestTrackingView({
    super.key,
    required this.guestAccessToken,
    this.header,
  });

  final String? guestAccessToken;

  /// Bloc optionnel affiché tout en haut (ex. message de confirmation).
  final Widget? header;

  @override
  State<RequestTrackingView> createState() => _RequestTrackingViewState();
}

class _RequestTrackingViewState extends State<RequestTrackingView> {
  Map<String, dynamic>? _data;
  bool _loading = true;
  bool _error = false;
  DateTime? _lastUpdate;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _load();
    _timer = Timer.periodic(const Duration(seconds: 30), (_) => _load());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _load() async {
    final token = widget.guestAccessToken;
    if (token == null || token.isEmpty) {
      setState(() {
        _loading = false;
        _error = true;
      });
      return;
    }
    try {
      final res = await SupabaseGroup.getguestrequestCall
          .call(guestAccessToken: token);
      final body = res.jsonBody;
      if (!mounted) return;
      if (res.succeeded && body is Map) {
        setState(() {
          _data = Map<String, dynamic>.from(body);
          _error = false;
          _loading = false;
          _lastUpdate = DateTime.now();
        });
      } else {
        setState(() {
          _error = _data == null;
          _loading = false;
        });
      }
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _error = _data == null;
        _loading = false;
      });
    }
  }

  // ---------------------------------------------------------------- utils
  bool get _fr => FFLocalizations.of(context).languageCode.startsWith('fr');
  String _l(String fr, String en) => _fr ? fr : en;

  String _s(String key) {
    final v = _data?[key];
    if (v == null) return '';
    return v.toString().replaceAll(RegExp(r"^[\s'\x22]+|[\s'\x22]+$"), '');
  }

  DateTime? _d(String key) {
    final v = _s(key);
    if (v.isEmpty) return null;
    return DateTime.tryParse(v)?.toLocal();
  }

  String _fmtTime(DateTime d) => DateFormat('HH:mm').format(d);
  String _fmtDate(DateTime d) {
    try {
      return DateFormat(
              _fr ? "EEEE d MMMM 'à' HH:mm" : "EEEE, MMMM d 'at' HH:mm",
              _fr ? 'fr' : 'en')
          .format(d);
    } catch (_) {
      return DateFormat('dd/MM/yyyy HH:mm').format(d);
    }
  }

  String _money(String key) {
    final v = num.tryParse(_s(key));
    if (v == null) return '—';
    return '${v.toStringAsFixed(v % 1 == 0 ? 0 : 2)} €';
  }

  bool _bool(String key) => _s(key).toLowerCase() == 'true';

  String get _status => _s('status').toLowerCase().replaceAll(' ', '_');
  String get _tech => _s('assigned_electrician_name');
  bool get _isAppointment =>
      _s('service_category').toLowerCase() == 'appointment';

  _Step get _step {
    switch (_status) {
      case 'pending':
      case 'refused':
        return _Step.searching;
      case 'completed':
      case 'awaiting_final_payment':
        return _Step.done;
      case 'arrived':
      case 'in_progress':
        return _Step.onSite;
      case 'electrician_on_his_way':
      case 'on_the_way':
        return _Step.onTheWay;
      case 'assigned':
      case 'accepted':
      case 'awaiting_deposit_payment':
      case 'deposit_paid':
        return _tech.isEmpty ? _Step.searching : _Step.assigned;
      default:
        return _tech.isEmpty ? _Step.searching : _Step.assigned;
    }
  }

  bool get _cancelled => _status == 'cancelled';

  // ---------------------------------------------------------------- build
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _load,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (widget.header != null) ...[
                  widget.header!,
                  const SizedBox(height: 16),
                ],
                if (_loading && _data == null)
                  const Padding(
                    padding: EdgeInsets.all(40),
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (_error)
                  _errorCard()
                else ...[
                  _statusHero(),
                  const SizedBox(height: 14),
                  _timeline(),
                  const SizedBox(height: 14),
                  _infoCard(
                    icon: Icons.person_rounded,
                    title: _l('Vos informations', 'Your details'),
                    rows: [
                      _row(_l('Nom', 'Name'), _s('customer_name')),
                      _row(_l('Téléphone', 'Phone'), _s('customer_phone')),
                      _row('E-mail', _s('customer_email')),
                      _row(_l('Adresse', 'Address'), _s('location_address')),
                    ],
                  ),
                  const SizedBox(height: 14),
                  _infoCard(
                    icon: Icons.build_circle_rounded,
                    title: _l('Votre demande', 'Your request'),
                    rows: [
                      _row(_l('Référence', 'Reference'),
                          _s('request_number')),
                      _row(
                          _l('Type', 'Type'),
                          _isAppointment
                              ? _l('Rendez-vous', 'Appointment')
                              : _l('Urgence', 'Emergency')),
                      _row(
                          _l('Envoyée le', 'Sent on'),
                          _d('created_date') != null
                              ? _fmtDate(_d('created_date')!)
                              : ''),
                      _row(_l('Problème', 'Problem'),
                          _s('problem_description')),
                    ],
                  ),
                  const SizedBox(height: 14),
                  _paymentCard(),
                  const SizedBox(height: 18),
                  _footer(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _errorCard() => _card(
        child: Column(
          children: [
            const Icon(Icons.search_off_rounded, size: 48, color: _muted),
            const SizedBox(height: 10),
            Text(
              _l('Nous n\'avons pas retrouvé votre demande.',
                  'We could not find your request.'),
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700, fontSize: 17, color: _ink),
            ),
            const SizedBox(height: 6),
            Text(
              _l('Réessayez dans un instant ou contactez-nous.',
                  'Please try again in a moment or contact us.'),
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(color: _muted),
            ),
            const SizedBox(height: 14),
            FilledButton.icon(
              onPressed: () {
                setState(() => _loading = true);
                _load();
              },
              icon: const Icon(Icons.refresh_rounded),
              label: Text(_l('Réessayer', 'Try again')),
            ),
          ],
        ),
      );

  // ----------------------------------------------------------- status hero
  Widget _statusHero() {
    late final Color color;
    late final IconData icon;
    late final String title;
    late final String text;
    Widget? extra;

    final created = _d('created_date');
    final eta = created?.add(kUrgentEta);

    if (_cancelled) {
      color = _red;
      icon = Icons.cancel_rounded;
      title = _l('Demande annulée', 'Request cancelled');
      text = _l('Cette intervention a été annulée. Contactez-nous si besoin.',
          'This job has been cancelled. Contact us if needed.');
    } else {
      switch (_step) {
        case _Step.received:
        case _Step.searching:
          color = _orange;
          icon = Icons.person_search_rounded;
          title = _l('Recherche d\'un technicien en cours…',
              'Looking for a technician…');
          text = _l(
              'Nous contactons les électriciens disponibles près de chez vous. Vous serez prévenu dès qu\'un technicien accepte.',
              'We are contacting available electricians near you. You will be notified as soon as one accepts.');
          extra = const _SearchingDots();
          break;
        case _Step.assigned:
          color = _blue;
          icon = Icons.engineering_rounded;
          title = _l('Technicien attribué', 'Technician assigned');
          text = _l('$_tech va intervenir chez vous.',
              '$_tech will handle your request.');
          break;
        case _Step.onTheWay:
          color = _blue;
          icon = Icons.directions_car_rounded;
          title = _l('Votre technicien est en route', 'Your technician is on the way');
          text = _l('$_tech arrive bientôt.', '$_tech is coming soon.');
          break;
        case _Step.onSite:
          color = _green;
          icon = Icons.handyman_rounded;
          title = _l('Intervention en cours', 'Work in progress');
          text = _l('$_tech est sur place.', '$_tech is on site.');
          break;
        case _Step.done:
          color = _green;
          icon = Icons.check_circle_rounded;
          title = _status == 'awaiting_final_payment'
              ? _l('Intervention terminée — paiement à régler',
                  'Job done — payment due')
              : _l('Intervention terminée', 'Job completed');
          text = _l('Merci de votre confiance !', 'Thank you for your trust!');
          break;
      }
    }

    String? etaText;
    if (!_cancelled && _step.index < _Step.onSite.index) {
      if (_isAppointment) {
        etaText = _l('Rendez-vous : au créneau que vous avez choisi.',
            'Appointment: at the time slot you chose.');
      } else if (eta != null) {
        final isLate = DateTime.now().isAfter(eta);
        etaText = isLate
            ? _l('Arrivée prévue : dès que possible',
                'Expected arrival: as soon as possible')
            : _l('Arrivée estimée : vers ${_fmtTime(eta)} (à titre indicatif)',
                'Estimated arrival: around ${_fmtTime(eta)} (indicative)');
      }
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [color, Color.lerp(color, _navy, 0.35)!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.35),
              blurRadius: 20,
              offset: const Offset(0, 8)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.18),
                    borderRadius: BorderRadius.circular(16)),
                child: Icon(icon, color: Colors.white, size: 30),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(title,
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 19,
                        height: 1.2)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(text,
              style: GoogleFonts.poppins(
                  color: Colors.white.withOpacity(0.92),
                  fontSize: 14.5,
                  height: 1.5)),
          if (extra != null) ...[const SizedBox(height: 10), extra],
          if (etaText != null) ...[
            const SizedBox(height: 14),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.16),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  const Icon(Icons.schedule_rounded,
                      color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(etaText,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14)),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    ).animate().fadeIn(duration: 350.ms).slideY(begin: 0.08);
  }

  // -------------------------------------------------------------- timeline
  Widget _timeline() {
    final steps = <(String, String?)>[
      (
        _l('Demande reçue', 'Request received'),
        _d('created_date') != null ? _fmtTime(_d('created_date')!) : null
      ),
      (_l('Recherche d\'un technicien', 'Finding a technician'), null),
      (
        _tech.isEmpty
            ? _l('Technicien attribué', 'Technician assigned')
            : _l('Technicien : $_tech', 'Technician: $_tech'),
        _d('assignment_time') != null ? _fmtTime(_d('assignment_time')!) : null
      ),
      (_l('En route', 'On the way'), null),
      (
        _l('Sur place / intervention', 'On site / working'),
        _d('start_time') != null ? _fmtTime(_d('start_time')!) : null
      ),
      (
        _l('Terminée', 'Completed'),
        _d('completion_time') != null ? _fmtTime(_d('completion_time')!) : null
      ),
    ];
    final current = _cancelled ? -1 : _step.index;
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cardTitle(Icons.timeline_rounded, _l('Suivi', 'Progress')),
          const SizedBox(height: 10),
          for (var i = 0; i < steps.length; i++)
            _timelineRow(
              label: steps[i].$1,
              time: steps[i].$2,
              done: i < current || (i == current && _step == _Step.done),
              active: i == current && _step != _Step.done,
              last: i == steps.length - 1,
            ),
        ],
      ),
    );
  }

  Widget _timelineRow({
    required String label,
    String? time,
    required bool done,
    required bool active,
    required bool last,
  }) {
    final color = done ? _green : (active ? _blue : const Color(0xFFC5CCDA));
    Widget dot = Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: done ? _green : Colors.white,
        border: Border.all(color: color, width: 3),
      ),
      child: done
          ? const Icon(Icons.check, size: 14, color: Colors.white)
          : null,
    );
    if (active) {
      dot = dot
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .scale(
              begin: const Offset(1, 1),
              end: const Offset(1.18, 1.18),
              duration: 700.ms);
    }
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 26,
            child: Column(
              children: [
                dot,
                if (!last)
                  Expanded(
                    child: Container(
                      width: 3,
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      color: done ? _green : _line,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: last ? 0 : 18, top: 1),
              child: Row(
                children: [
                  Expanded(
                    child: Text(label,
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: (done || active) ? _ink : _muted,
                            fontWeight: active
                                ? FontWeight.w700
                                : FontWeight.w500)),
                  ),
                  if (time != null)
                    Text(time,
                        style: GoogleFonts.poppins(
                            fontSize: 13, color: _muted)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------- payments
  Widget _paymentCard() {
    final depositPaid = _bool('deposit_paid');
    final finalPaid = _bool('final_payment_paid');
    return _infoCard(
      icon: Icons.euro_rounded,
      title: _l('Paiement', 'Payment'),
      rows: [
        _row(
            _l('Acompte', 'Deposit'),
            '${_money('deposit_amount')}  ·  ${depositPaid ? _l('payé ✓', 'paid ✓') : _l('non payé', 'not paid')}'),
        _row(
            _l('Reste à payer', 'Balance'),
            '${_money('remaining_amount')}  ·  ${finalPaid ? _l('payé ✓', 'paid ✓') : _l('après l\'intervention', 'after the job')}'),
      ],
    );
  }

  // ---------------------------------------------------------------- footer
  Widget _footer() {
    final upd = _lastUpdate;
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          runSpacing: 10,
          children: [
            OutlinedButton.icon(
              onPressed: _load,
              icon: const Icon(Icons.refresh_rounded),
              label: Text(_l('Actualiser', 'Refresh')),
            ),
            FilledButton.icon(
              style: FilledButton.styleFrom(backgroundColor: _navy),
              onPressed: () => context.pushNamed(ContactWidget.routeName),
              icon: const Icon(Icons.support_agent_rounded),
              label: Text(_l('Nous contacter', 'Contact us')),
            ),
          ],
        ),
        if (upd != null)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              _l('Mis à jour à ${_fmtTime(upd)} · actualisation automatique',
                  'Updated at ${_fmtTime(upd)} · auto-refresh'),
              style: GoogleFonts.poppins(fontSize: 12, color: _muted),
            ),
          ),
      ],
    );
  }

  // ---------------------------------------------------------------- pieces
  Widget _card({required Widget child}) => Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: _line),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 12,
                offset: const Offset(0, 4)),
          ],
        ),
        child: child,
      );

  Widget _cardTitle(IconData icon, String title) => Row(
        children: [
          Icon(icon, color: _blue, size: 22),
          const SizedBox(width: 8),
          Text(title,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700, fontSize: 16, color: _ink)),
        ],
      );

  Widget _infoCard({
    required IconData icon,
    required String title,
    required List<Widget?> rows,
  }) =>
      _card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cardTitle(icon, title),
            const SizedBox(height: 8),
            ...rows.whereType<Widget>(),
          ],
        ),
      );

  Widget? _row(String label, String value) {
    if (value.trim().isEmpty) return null;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(label,
                style: GoogleFonts.poppins(fontSize: 13.5, color: _muted)),
          ),
          Expanded(
            child: Text(value,
                style: GoogleFonts.poppins(
                    fontSize: 14.5,
                    color: _ink,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}

/// Trois points qui clignotent pendant la recherche d'un technicien.
class _SearchingDots extends StatelessWidget {
  const _SearchingDots();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < 3; i++)
          Container(
            margin: const EdgeInsets.only(right: 6),
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
          )
              .animate(onPlay: (c) => c.repeat())
              .fadeOut(delay: (i * 200).ms, duration: 600.ms)
              .then()
              .fadeIn(duration: 600.ms),
      ],
    );
  }
}
