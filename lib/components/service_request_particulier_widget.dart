import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'service_request_particulier_model.dart';
export 'service_request_particulier_model.dart';

class ServiceRequestParticulierWidget extends StatefulWidget {
  const ServiceRequestParticulierWidget({
    super.key,
    required this.serviceRequest,
    this.customerName,
    String? requestNumber,
    String? problemDescription,
    String? staTus,
  })  : this.requestNumber = requestNumber ?? 'request number',
        this.problemDescription = problemDescription ?? 'problem description',
        this.staTus = staTus ?? 'status';

  final ServiceRequestsRow? serviceRequest;
  final String? customerName;

  /// request number
  final String requestNumber;

  /// problem description
  final String problemDescription;

  /// status
  final String staTus;

  @override
  State<ServiceRequestParticulierWidget> createState() =>
      _ServiceRequestParticulierWidgetState();
}

class _ServiceRequestParticulierWidgetState
    extends State<ServiceRequestParticulierWidget> {
  late ServiceRequestParticulierModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServiceRequestParticulierModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 426.9,
      height: 576.65,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget!.problemDescription,
                'problem description',
              ),
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ),
          Text(
            valueOrDefault<String>(
              widget!.serviceRequest?.createdDate?.toString(),
              'created_date',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          Container(
            width: 140.3,
            height: 31.2,
            decoration: BoxDecoration(
              color: () {
                if (widget!.serviceRequest?.status == 'pending') {
                  return FlutterFlowTheme.of(context).warning;
                } else if (widget!.serviceRequest?.status == 'assigned') {
                  return FlutterFlowTheme.of(context).tertiary;
                } else if (widget!.serviceRequest?.status == 'completed') {
                  return FlutterFlowTheme.of(context).secondary;
                } else if (widget!.serviceRequest?.status == 'cancelled') {
                  return FlutterFlowTheme.of(context).error;
                } else {
                  return Color(0x9FE0E3E7);
                }
              }(),
            ),
            child: Text(
              valueOrDefault<String>(
                widget!.staTus,
                'status',
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
