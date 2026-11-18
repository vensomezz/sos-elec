import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';

/// Couleurs de la page d'accueil visiteur.
const _navy = Color(0xFF0B1D3A);
const _navy2 = Color(0xFF12305E);
const _blue = Color(0xFF1D4ED8);
const _yellow = Color(0xFFFFC400);
const _red = Color(0xFFE53935);
const _ink = Color(0xFF14213D);
const _muted = Color(0xFF5B6478);
const _paper = Color(0xFFF4F7FC);

/// Corps de la page d'accueil : hero animé, services, atouts, appel à
/// l'action et pied de page. Les textes viennent des traductions FR/EN
/// existantes de l'application.
class VisitorHomeBody extends StatelessWidget {
  const VisitorHomeBody({super.key});

  String _t(BuildContext context, String key) =>
      FFLocalizations.of(context).getText(key).trim();

  bool _fr(BuildContext context) =>
      FFLocalizations.of(context).languageCode.startsWith('fr');

  void _requestService(BuildContext context) {
    if (loggedIn) {
      context.pushNamed(CreateRequestPageWidget.routeName);
    } else {
      context.pushNamed(RequestOptionsPageWidget.routeName);
    }
  }

  void _account(BuildContext context) {
    if (loggedIn) {
      context.pushNamed(ClientHomeWidget.routeName);
    } else {
      context.pushNamed(Auth1Widget.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      final wide = c.maxWidth >= 820;
      return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _hero(context, wide),
            _section(
              context,
              title: _t(context, '5aoszjlf'),
              subtitle: _t(context, 'g6ku7ht2'),
              background: Colors.white,
              children: [
                _ServiceCard(
                  icon: Icons.flash_on_rounded,
                  color: _red,
                  title: _t(context, 'f1wxrdu6'),
                  text: _t(context, 'u6s52wwo'),
                  onTap: () => _requestService(context),
                ),
                _ServiceCard(
                  icon: Icons.electrical_services_rounded,
                  color: _blue,
                  title: _t(context, 'iw9y10go'),
                  text: _t(context, 'mleliphn'),
                  onTap: () => _requestService(context),
                ),
                _ServiceCard(
                  icon: Icons.apartment_rounded,
                  color: const Color(0xFF0E9F6E),
                  title: _t(context, 'x59ycagh'),
                  text: _t(context, '71mf7fva'),
                  onTap: () => context.pushNamed(ContactWidget.routeName),
                ),
              ],
              wide: wide,
            ),
            _section(
              context,
              title: _t(context, 'zc08i5tw'),
              background: _paper,
              children: [
                _ServiceCard(
                  icon: Icons.timer_rounded,
                  color: _yellow,
                  iconColor: _ink,
                  title: _t(context, 'ge2n7wmd'),
                  text: _t(context, 'wzya3njs'),
                ),
                _ServiceCard(
                  icon: Icons.receipt_long_rounded,
                  color: _blue,
                  title: _t(context, 'v8ojqay5'),
                  text: _t(context, '50vwimxu'),
                  onTap: () => context.pushNamed(OurpricesWidget.routeName),
                ),
                _ServiceCard(
                  icon: Icons.verified_rounded,
                  color: const Color(0xFF0E9F6E),
                  title: _t(context, 'eymqcjuo'),
                  text: _t(context, 'imwpy6m2'),
                ),
              ],
              wide: wide,
            ),
            _ctaBand(context, wide),
            _footer(context),
          ],
        ),
      );
    });
  }

  // ---------------------------------------------------------------- HERO
  Widget _hero(BuildContext context, bool wide) {
    final fr = _fr(context);
    final chips = fr
        ? ['24h/24 · 7j/7', 'Intervention rapide', 'Tarifs transparents']
        : ['24/7 service', 'Fast response', 'Transparent pricing'];
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [_navy, _navy2, _blue],
        ),
      ),
      child: Stack(
        children: [
          // Éclairs décoratifs en fond
          Positioned(
            right: -30,
            top: -10,
            child: Icon(Icons.bolt_rounded,
                    size: wide ? 320 : 220,
                    color: Colors.white.withOpacity(0.06))
                .animate(onPlay: (c) => c.repeat(reverse: true))
                .moveY(begin: 0, end: 14, duration: 2600.ms, curve: Curves.easeInOut),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                22, wide ? 64 : 36, 22, wide ? 72 : 44),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 980),
                child: Column(
                  children: [
                    _PulsingBolt(size: wide ? 92 : 76),
                    const SizedBox(height: 22),
                    Text(
                      _t(context, 'yojef4vs'),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: wide ? 40 : 27,
                        height: 1.15,
                      ),
                    ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.2),
                    const SizedBox(height: 14),
                    Text(
                      _t(context, 'ktv7e2tl'),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white.withOpacity(0.86),
                        fontSize: wide ? 18 : 15,
                        height: 1.5,
                      ),
                    ).animate().fadeIn(delay: 150.ms, duration: 500.ms),
                    const SizedBox(height: 22),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (var i = 0; i < chips.length; i++)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 7),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.25)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.check_circle_rounded,
                                    color: _yellow, size: 16),
                                const SizedBox(width: 6),
                                Text(chips[i],
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          )
                              .animate()
                              .fadeIn(delay: (250 + i * 120).ms)
                              .scale(begin: const Offset(0.85, 0.85)),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 14,
                      runSpacing: 14,
                      children: [
                        _HoverButton(
                          label: _t(context, 'mvqfzi6i'),
                          icon: Icons.flash_on_rounded,
                          background: _red,
                          foreground: Colors.white,
                          pulse: true,
                          onTap: () => _requestService(context),
                        ),
                        _HoverButton(
                          label: _t(context, '0r9jqeu9'),
                          icon: Icons.person_rounded,
                          background: Colors.white,
                          foreground: _navy,
                          onTap: () => _account(context),
                        ),
                      ],
                    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.3),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------ SECTIONS
  Widget _section(
    BuildContext context, {
    required String title,
    String? subtitle,
    required Color background,
    required List<Widget> children,
    required bool wide,
  }) {
    return Container(
      color: background,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: wide ? 56 : 38),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    color: _ink,
                    fontWeight: FontWeight.w800,
                    fontSize: wide ? 32 : 24),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 8),
                width: 56,
                height: 4,
                decoration: BoxDecoration(
                    color: _yellow, borderRadius: BorderRadius.circular(4)),
              ),
              if (subtitle != null && subtitle.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(subtitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: _muted, fontSize: 15, height: 1.5)),
                ),
              const SizedBox(height: 26),
              if (wide)
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (var i = 0; i < children.length; i++) ...[
                        if (i > 0) const SizedBox(width: 18),
                        Expanded(child: _reveal(children[i], i)),
                      ]
                    ],
                  ),
                )
              else
                Column(
                  children: [
                    for (var i = 0; i < children.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: _reveal(children[i], i),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _reveal(Widget w, int i) => w
      .animate()
      .fadeIn(delay: (120 * i).ms, duration: 450.ms)
      .slideY(begin: 0.15, curve: Curves.easeOut);

  // ------------------------------------------------------------ CTA BAND
  Widget _ctaBand(BuildContext context, bool wide) {
    final fr = _fr(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: wide ? 48 : 34),
      color: _navy,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              Text(
                fr
                    ? 'Une panne ? On s\'en occupe maintenant.'
                    : 'Power problem? We\'re on it now.',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: wide ? 28 : 22),
              ),
              const SizedBox(height: 20),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 12,
                children: [
                  _HoverButton(
                    label: _t(context, 'mvqfzi6i'),
                    icon: Icons.flash_on_rounded,
                    background: _red,
                    foreground: Colors.white,
                    onTap: () => _requestService(context),
                  ),
                  _HoverButton(
                    label: _t(context, 'ycf7ll0p'),
                    icon: Icons.smart_toy_rounded,
                    background: _yellow,
                    foreground: _ink,
                    onTap: () => context
                        .pushNamed(AIAssistantPageCopyWidget.routeName),
                  ),
                  _HoverButton(
                    label: _t(context, '1sqfzgtq'),
                    icon: Icons.euro_rounded,
                    background: Colors.white,
                    foreground: _navy,
                    onTap: () => context.pushNamed(OurpricesWidget.routeName),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // -------------------------------------------------------------- FOOTER
  Widget _footer(BuildContext context) {
    Widget link(String key, String route) => TextButton(
          onPressed: () => context.pushNamed(route),
          child: Text(
            _t(context, key).replaceAll('|', '').trim(),
            style: GoogleFonts.poppins(
                color: Colors.white70, fontSize: 13),
          ),
        );
    return Container(
      color: const Color(0xFF07142A),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              link('xh0kww2q', LegalnoticeWidget.routeName),
              link('rdeb9fph', TermsandconditionsWidget.routeName),
              link('ocfhh710', PrivacypolicyWidget.routeName),
              link('evxyvvg1', ContactWidget.routeName),
            ],
          ),
          const SizedBox(height: 6),
          Text('© ${DateTime.now().year} SOS Electricity',
              style: GoogleFonts.poppins(color: Colors.white38, fontSize: 12)),
        ],
      ),
    );
  }
}

/// Éclair dans un cercle lumineux qui « respire ».
class _PulsingBolt extends StatelessWidget {
  const _PulsingBolt({required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _yellow,
        boxShadow: [
          BoxShadow(
              color: _yellow.withOpacity(0.55),
              blurRadius: 30,
              spreadRadius: 2),
        ],
      ),
      child: Icon(Icons.bolt_rounded, color: _navy, size: size * 0.62),
    )
        .animate(onPlay: (c) => c.repeat(reverse: true))
        .scale(
            begin: const Offset(1, 1),
            end: const Offset(1.08, 1.08),
            duration: 1200.ms,
            curve: Curves.easeInOut);
  }
}

/// Bouton arrondi qui grossit au survol / à l'appui. Option « pulse »
/// pour attirer l'œil sur le bouton d'urgence.
class _HoverButton extends StatefulWidget {
  const _HoverButton({
    required this.label,
    required this.icon,
    required this.background,
    required this.foreground,
    required this.onTap,
    this.pulse = false,
  });

  final String label;
  final IconData icon;
  final Color background;
  final Color foreground;
  final VoidCallback onTap;
  final bool pulse;

  @override
  State<_HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<_HoverButton> {
  bool _hover = false;
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final scale = _down ? 0.96 : (_hover ? 1.05 : 1.0);
    Widget btn = AnimatedScale(
      scale: scale,
      duration: const Duration(milliseconds: 140),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        decoration: BoxDecoration(
          color: widget.background,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: widget.background.withOpacity(_hover ? 0.55 : 0.30),
              blurRadius: _hover ? 22 : 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon, color: widget.foreground, size: 22),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                widget.label,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    color: widget.foreground,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
    if (widget.pulse && !_hover) {
      btn = btn
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .scale(
              begin: const Offset(1, 1),
              end: const Offset(1.04, 1.04),
              duration: 900.ms,
              curve: Curves.easeInOut);
    }
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() {
        _hover = false;
        _down = false;
      }),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _down = true),
        onTapCancel: () => setState(() => _down = false),
        onTapUp: (_) => setState(() => _down = false),
        onTap: widget.onTap,
        child: btn,
      ),
    );
  }
}

/// Carte de service : se soulève au survol, cliquable si [onTap].
class _ServiceCard extends StatefulWidget {
  const _ServiceCard({
    required this.icon,
    required this.color,
    required this.title,
    required this.text,
    this.iconColor = Colors.white,
    this.onTap,
  });

  final IconData icon;
  final Color color;
  final Color iconColor;
  final String title;
  final String text;
  final VoidCallback? onTap;

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, _hover ? -6 : 0, 0),
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: _hover ? widget.color : const Color(0xFFE3E8F2),
                width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_hover ? 0.10 : 0.04),
                blurRadius: _hover ? 26 : 12,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: AnimatedRotation(
                  turns: _hover ? 0.03 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(widget.icon, color: widget.iconColor, size: 28),
                ),
              ),
              const SizedBox(height: 16),
              Text(widget.title,
                  style: GoogleFonts.montserrat(
                      color: _ink, fontWeight: FontWeight.w700, fontSize: 18)),
              const SizedBox(height: 8),
              Text(widget.text,
                  style: GoogleFonts.poppins(
                      color: _muted, fontSize: 14.5, height: 1.55)),
              if (widget.onTap != null) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      FFLocalizations.of(context).languageCode.startsWith('fr')
                          ? 'En savoir plus'
                          : 'Learn more',
                      style: GoogleFonts.poppins(
                          color: widget.color == _yellow ? _ink : widget.color,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    AnimatedPadding(
                      duration: const Duration(milliseconds: 200),
                      padding: EdgeInsets.only(left: _hover ? 8 : 4),
                      child: Icon(Icons.arrow_forward_rounded,
                          size: 18,
                          color:
                              widget.color == _yellow ? _ink : widget.color),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
