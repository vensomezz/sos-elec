import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/request_tracking_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'request_confirmation_page_model.dart';
export 'request_confirmation_page_model.dart';

class RequestConfirmationPageWidget extends StatefulWidget {
  const RequestConfirmationPageWidget({
    super.key,
    required this.requestId,
    required this.guestAccessToken,
    required this.requestNumber,
  });

  final String? requestId;
  final String? guestAccessToken;
  final String? requestNumber;

  static String routeName = 'RequestConfirmationPage';
  static String routePath = '/requestConfirmationPage';

  @override
  State<RequestConfirmationPageWidget> createState() =>
      _RequestConfirmationPageWidgetState();
}

class _RequestConfirmationPageWidgetState
    extends State<RequestConfirmationPageWidget> {
  late RequestConfirmationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestConfirmationPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'qi44l1g7' /* Request confirmation page */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.montserrat(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: RequestTrackingView(
            guestAccessToken: widget!.guestAccessToken,
            header: Container(
              padding: EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                color: Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(18.0),
                border: Border.all(color: Color(0xFFA5D6A7)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.check_circle_rounded,
                          color: Color(0xFF2E7D32), size: 28.0),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Text(
                          FFLocalizations.of(context)
                                  .languageCode
                                  .startsWith('fr')
                              ? 'Demande envoyée !'
                              : 'Request sent!',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w800,
                            fontSize: 20.0,
                            color: Color(0xFF1B5E20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    FFLocalizations.of(context).getText('e28ocxhw'),
                    style: GoogleFonts.poppins(
                        fontSize: 14.0, color: Color(0xFF14213D)),
                  ),
                  SizedBox(height: 10.0),
                  SelectableText(
                    '${FFLocalizations.of(context).getText('hdii7p09').trim()} ${widget!.requestNumber ?? ''}',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 15.0,
                        color: Color(0xFF14213D)),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    FFLocalizations.of(context)
                            .languageCode
                            .startsWith('fr')
                        ? 'Gardez cette page : elle se met à jour automatiquement.'
                        : 'Keep this page: it updates automatically.',
                    style: GoogleFonts.poppins(
                        fontSize: 12.5, color: Color(0xFF5B6478)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
