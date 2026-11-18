import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/cancel_job_dialog_widget.dart';
import '/components/service_request_electrician_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'electricien_home_model.dart';
export 'electricien_home_model.dart';

class ElectricienHomeWidget extends StatefulWidget {
  const ElectricienHomeWidget({super.key});

  static String routeName = 'ElectricienHome';
  static String routePath = '/electricienHome';

  @override
  State<ElectricienHomeWidget> createState() => _ElectricienHomeWidgetState();
}

class _ElectricienHomeWidgetState extends State<ElectricienHomeWidget> {
  late ElectricienHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ElectricienHomeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ServiceRequestsRow>>(
      future: ServiceRequestsTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'assigned_electrician_uuid',
              currentUserUid,
            )
            .eqOrNull(
              'status',
              'assigned',
            )
            .order('created_date'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ServiceRequestsRow> electricienHomeServiceRequestsRowList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: Text(
                FFLocalizations.of(context).getText(
                  '2uoymg8f' /* Electrician */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: Colors.white,
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Builder(
                        builder: (context) {
                          final serviceRequestItem =
                              electricienHomeServiceRequestsRowList.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: serviceRequestItem.length,
                            itemBuilder: (context, serviceRequestItemIndex) {
                              final serviceRequestItemItem =
                                  serviceRequestItem[serviceRequestItemIndex];
                              return Padding(
                                padding: EdgeInsets.all(18.0),
                                child: wrapWithModel(
                                  model: _model.serviceRequestElectricianModels
                                      .getModel(
                                    serviceRequestItemItem.id!,
                                    serviceRequestItemIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: ServiceRequestElectricianWidget(
                                    key: Key(
                                      'Keyqlu_${serviceRequestItemItem.id!}',
                                    ),
                                    serviceRequest: serviceRequestItemItem,
                                    onCancelpressed: () async {
                                      _model.showCancelDialog = true;
                                      safeSetState(() {});
                                    },
                                    onRefusepressed: () async {
                                      _model.showRefuseDialog = true;
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  if (_model.showCancelDialog == true)
                    wrapWithModel(
                      model: _model.cancelJobDialogModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CancelJobDialogWidget(
                        serviceRequest: _model.selectedServiceRequest!,
                        onclose: () async {
                          _model.showCancelDialog = false;
                          safeSetState(() {});
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
