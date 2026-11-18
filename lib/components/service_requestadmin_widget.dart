import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/cancel_job_dialog_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/request_media.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'service_requestadmin_model.dart';
export 'service_requestadmin_model.dart';

class ServiceRequestadminWidget extends StatefulWidget {
  const ServiceRequestadminWidget({
    super.key,
    required this.serviceRequest,
  });

  final ServiceRequestsRow? serviceRequest;

  @override
  State<ServiceRequestadminWidget> createState() =>
      _ServiceRequestadminWidgetState();
}

class _ServiceRequestadminWidgetState extends State<ServiceRequestadminWidget> {
  late ServiceRequestadminModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServiceRequestadminModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 507.33,
      height: 518.5,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              valueOrDefault<String>(
                widget!.serviceRequest?.createdDate?.toString(),
                'created date',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.poppins(
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
            Container(
              width: 179.8,
              height: 24.59,
              decoration: BoxDecoration(
                color: widget!.serviceRequest?.clientType == 'business'
                    ? Color(0xFF91D2EA)
                    : Color(0xFF1BE18A),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget!.serviceRequest?.clientType == 'residential')
                    Icon(
                      Icons.house_sharp,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  if (widget!.serviceRequest?.clientType == 'business')
                    Icon(
                      Icons.business,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  Text(
                    widget!.serviceRequest?.clientType == 'business'
                        ? 'Business'
                        : 'Residentiel',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
            ),
            Text(
              valueOrDefault<String>(
                widget!.serviceRequest?.customerName,
                'customer name',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.poppins(
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
            Text(
              valueOrDefault<String>(
                widget!.serviceRequest?.requestNumber,
                'request number',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.poppins(
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
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    JobDetailsPageWidget.routeName,
                    queryParameters: {
                      'serviceRequest': serializeParam(
                        widget!.serviceRequest,
                        ParamType.SupabaseRow,
                      ),
                    }.withoutNulls,
                  );
                },
                child: Text(
                  valueOrDefault<String>(
                    widget!.serviceRequest?.problemDescription,
                    'problem description',
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
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
            ),
            Container(
              width: 140.3,
              height: 23.1,
              decoration: BoxDecoration(
                color: () {
                  if (widget!.serviceRequest?.status == 'pending') {
                    return FlutterFlowTheme.of(context).warning;
                  } else if (widget!.serviceRequest?.status == 'accepted') {
                    return FlutterFlowTheme.of(context).tertiary;
                  } else if (widget!.serviceRequest?.status ==
                      'completed') {
                    return FlutterFlowTheme.of(context).secondary;
                  } else if (widget!.serviceRequest?.status ==
                      'cancelled') {
                    return FlutterFlowTheme.of(context).error;
                  } else {
                    return Color(0x9FE0E3E7);
                  }
                }(),
              ),
              child: Text(
                valueOrDefault<String>(
                  widget!.serviceRequest?.status,
                  'Status',
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.poppins(
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
              child: RequestMediaGallery(
                photoUrls: widget!.serviceRequest?.photoUrls,
              ),
            ),
            FlutterFlowDropDown<String>(
              controller: _model.dropDownValueController1 ??=
                  FormFieldController<String>(null),
              options: [
                FFLocalizations.of(context).getText(
                  'mku1jtlz' /* Haut (urgence)  */,
                ),
                FFLocalizations.of(context).getText(
                  'wu8vcj6f' /* Moyen  */,
                ),
                FFLocalizations.of(context).getText(
                  'an2ejor9' /* Bas  */,
                )
              ],
              onChanged: (val) async {
                safeSetState(() => _model.dropDownValue1 = val);
                await ServiceRequestsTable().update(
                  data: {
                    'urgency_level': _model.dropDownValue1,
                  },
                  matchingRows: (rows) => rows.eqOrNull(
                    'id',
                    widget!.serviceRequest?.id,
                  ),
                );
              },
              width: 279.4,
              height: 40.0,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.poppins(
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
              hintText: FFLocalizations.of(context).getText(
                'lumd3zbc' /* Select level of urgency */,
              ),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              elevation: 2.0,
              borderColor: Colors.transparent,
              borderWidth: 0.0,
              borderRadius: 8.0,
              margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              hidesUnderline: true,
              isOverButton: false,
              isSearchable: false,
              isMultiSelect: false,
            ),
            FutureBuilder<List<UsersRow>>(
              future: UsersTable().queryRows(
                queryFn: (q) => q
                    .eqOrNull(
                      'role',
                      'electrician',
                    )
                    .eqOrNull(
                      'is_available',
                      true,
                    ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<UsersRow> dropDownUsersRowList = snapshot.data!;

                return FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController2 ??=
                      FormFieldController<String>(
                    _model.dropDownValue2 ??= '',
                  ),
                  options: List<String>.from(dropDownUsersRowList
                      .map((e) => e.id)
                      .withoutNulls
                      .toList()),
                  optionLabels:
                      dropDownUsersRowList.map((e) => e.name).toList(),
                  onChanged: (val) async {
                    safeSetState(() => _model.dropDownValue2 = val);
                    _model.selectedElectrician = _model.dropDownValue2;
                    safeSetState(() {});
                  },
                  width: 241.4,
                  height: 40.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    'dnxjxjzw' /* Select... */,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: Colors.transparent,
                  borderWidth: 0.0,
                  borderRadius: 8.0,
                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  hidesUnderline: true,
                  isOverButton: false,
                  isSearchable: false,
                  isMultiSelect: false,
                );
              },
            ),
            if (widget!.serviceRequest?.status == 'accepted')
              Container(
                width: 398.3,
                height: 32.39,
                decoration: BoxDecoration(
                  color: Color(0xFFDBA9A9),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_sharp,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '7zktkh1k' /* The electrician has accepted t... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
              ),
            if (widget!.serviceRequest?.status == 'deposit_paid')
              Container(
                width: 407.5,
                height: 22.6,
                decoration: BoxDecoration(
                  color: Color(0x4D39D24C),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_sharp,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '93t6aqhk' /* ✅ Deposit received. */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
              ),
            if (FFAppState().isAdmin)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: FutureBuilder<List<UsersRow>>(
                  future: UsersTable().querySingleRow(
                    queryFn: (q) => q.eqOrNull(
                      'id',
                      _model.selectedElectrician,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<UsersRow> buttonUsersRowList = snapshot.data!;

                    final buttonUsersRow = buttonUsersRowList.isNotEmpty
                        ? buttonUsersRowList.first
                        : null;

                    return FFButtonWidget(
                      onPressed: () async {
                        await ServiceRequestsTable().update(
                          data: {
                            'assigned_electrician_uuid': _model.dropDownValue2,
                            'status': 'assigned',
                            'assignment_time': getCurrentTimestamp.toString(),
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'id',
                            widget!.serviceRequest?.id,
                          ),
                        );
                        await actions.notifyUser(
                          _model.dropDownValue2,
                          'Nouvelle mission / New job',
                          'Une nouvelle intervention vous a été attribuée. / A new service request has been assigned to you.',
                        );

                        _model.updatePage(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        '6ycrjdfl' /* Assign electrician */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    );
                  },
                ),
              ),
            Builder(
              builder: (context) => Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if ((FFAppState().userRole == 'admin') ||
                        (FFAppState().userRole == 'electrician')) {
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: CancelJobDialogWidget(
                              serviceRequest: widget!.serviceRequest!,
                              onclose: () async {
                                Navigator.pop(context);
                              },
                            ),
                          );
                        },
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'You are not allowed to cancel this job',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                      return;
                    }

                    await ServiceRequestsTable().update(
                      data: {
                        'status': 'cancelled',
                      },
                      matchingRows: (rows) => rows.eqOrNull(
                        'id',
                        widget!.serviceRequest?.id,
                      ),
                    );
                    _model.updatePage(() {});
                  },
                  text: FFLocalizations.of(context).getText(
                    'n5kpxsec' /* Cancel Job */,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
