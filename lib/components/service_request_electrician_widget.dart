import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
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
import 'service_request_electrician_model.dart';
export 'service_request_electrician_model.dart';

class ServiceRequestElectricianWidget extends StatefulWidget {
  const ServiceRequestElectricianWidget({
    super.key,
    required this.serviceRequest,
    required this.onCancelpressed,
    required this.onRefusepressed,
  });

  final ServiceRequestsRow? serviceRequest;
  final Future Function()? onCancelpressed;
  final Future Function()? onRefusepressed;

  @override
  State<ServiceRequestElectricianWidget> createState() =>
      _ServiceRequestElectricianWidgetState();
}

class _ServiceRequestElectricianWidgetState
    extends State<ServiceRequestElectricianWidget> {
  late ServiceRequestElectricianModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServiceRequestElectricianModel());

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
      width: 737.7,
      height: 780.7,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
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
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          Container(
            width: 179.8,
            height: 24.6,
            decoration: BoxDecoration(
              color: widget!.serviceRequest?.clientType == 'business'
                  ? Color(0xFF91D2EA)
                  : Color(0xFF1BE18A),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
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
              ],
            ),
          ),
          if (widget!.serviceRequest?.dispatchAuthorized == true)
            Text(
              valueOrDefault<String>(
                widget!.serviceRequest?.locationAddress,
                'address',
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
          if (widget!.serviceRequest?.dispatchAuthorized == true)
            Text(
              valueOrDefault<String>(
                widget!.serviceRequest?.customerPhone,
                'customer phone',
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
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.poppins(
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
          ),
          Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
              child: RequestMediaGallery(
                photoUrls: widget!.serviceRequest?.photoUrls,
              ),
            ),
          Container(
            width: 140.3,
            height: 31.21,
            decoration: BoxDecoration(
              color: () {
                if (widget!.serviceRequest?.status == 'pending') {
                  return FlutterFlowTheme.of(context).warning;
                } else if (widget!.serviceRequest?.status == 'accepted') {
                  return FlutterFlowTheme.of(context).tertiary;
                } else if (widget!.serviceRequest?.status == 'completed') {
                  return FlutterFlowTheme.of(context).secondary;
                } else if (widget!.serviceRequest?.status == 'cancelled') {
                  return FlutterFlowTheme.of(context).error;
                } else {
                  return FlutterFlowTheme.of(context).primaryBackground;
                }
              }(),
            ),
            child: Text(
              valueOrDefault<String>(
                widget!.serviceRequest?.status,
                'status',
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
                controller: _model.dropDownValueController ??=
                    FormFieldController<String>(
                  _model.dropDownValue ??= '',
                ),
                options: List<String>.from([
                  'emergency_fault',
                  'lighting',
                  'socket_repair',
                  'fuse_board',
                  'ev_charger',
                  'rewiring',
                  'inspection'
                ]),
                optionLabels: [
                  FFLocalizations.of(context).getText(
                    'l5lf2u02' /* Panne  électrique urgente */,
                  ),
                  FFLocalizations.of(context).getText(
                    '9i1pekmk' /* Éclairage */,
                  ),
                  FFLocalizations.of(context).getText(
                    'lmspruee' /* Réparation de prise électrique */,
                  ),
                  FFLocalizations.of(context).getText(
                    '5l14bjxe' /* Tableau électrique  */,
                  ),
                  FFLocalizations.of(context).getText(
                    'er2eitld' /* Chargeur pour véhicule électri... */,
                  ),
                  FFLocalizations.of(context).getText(
                    'jziajk03' /* Recâblage  */,
                  ),
                  FFLocalizations.of(context).getText(
                    'u9g0gjxp' /* Inspection de sécurité électri... */,
                  )
                ],
                onChanged: (val) =>
                    safeSetState(() => _model.dropDownValue = val),
                width: 324.2,
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
                  'y5lod8ds' /* Select the job category */,
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
          if (widget!.serviceRequest?.status == 'deposit_paid')
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 0.0),
              child: Container(
                width: 379.2,
                height: 36.8,
                decoration: BoxDecoration(
                  color: Color(0x4D39D24C),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
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
                          'ig1o9268' /* ✅ Deposit received.
You may no... */
                          ,
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
              ),
            ),
          if ((widget!.serviceRequest?.dispatchAuthorized == true) &&
              (widget!.serviceRequest?.clientType == 'business'))
            Container(
              width: 370.9,
              height: 49.6,
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
                      'ukhhe0u2' /* Dispatch authorized.
You may n... */
                      ,
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
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
            ),
          if (widget!.serviceRequest?.status == 'assigned')
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Container(
                width: 200.0,
                height: 33.39,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget!.serviceRequest?.status == 'assigned')
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (_model.dropDownValue != null &&
                                  _model.dropDownValue != '') {
                                await ServiceRequestsTable().update(
                                  data: {
                                    'status': 'accepted',
                                    'responded_at': supaSerialize<DateTime>(
                                        getCurrentTimestamp),
                                    'work_category': _model.dropDownValue,
                                    'assignment_time':
                                        getCurrentTimestamp.toString(),
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    widget!.serviceRequest?.id,
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Mission acceptée / Job accepted',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                                await actions.notifyUser(
                            widget!.serviceRequest?.customerUuid,
                            'Mission acceptée / Job accepted',
                            'Un électricien a accepté votre demande. / An electrician accepted your request.',
                          );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Veuillez sélectionner une catégorie d\'intervention  avant d\'accepter la demande. / Please select a job category before accepting the request.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }
                            },
                            text: FFLocalizations.of(context).getText(
                              'ier3enip' /* Accept */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
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
                          ),
                        ),
                      ),
                    if (widget!.serviceRequest?.status == 'assigned')
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await widget.onRefusepressed?.call();
                            },
                            text: FFLocalizations.of(context).getText(
                              'om5l6cp9' /* Refuse */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
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
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget!.serviceRequest?.dispatchAuthorized == true)
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await ServiceRequestsTable().update(
                            data: {
                              'status': 'electrician_on_his_way',
                              'created_date':
                                  supaSerialize<DateTime>(getCurrentTimestamp),
                            },
                            matchingRows: (rows) => rows,
                          );
                          await actions.notifyUser(
                            widget!.serviceRequest?.customerUuid,
                            'Électricien en route / Electrician on the way',
                            'Votre électricien est en route. / Your electrician is on the way.',
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'rsjrksdk' /* Start journey */,
                        ),
                        options: FFButtonOptions(
                          height: 33.99,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
                      ),
                    ),
                  ),
                if (widget!.serviceRequest?.dispatchAuthorized == true)
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await ServiceRequestsTable().update(
                            data: {
                              'status': 'arrived',
                            },
                            matchingRows: (rows) => rows,
                          );
                          await actions.notifyUser(
                            widget!.serviceRequest?.customerUuid,
                            'Électricien arrivé / Electrician arrived',
                            'Votre électricien est arrivé. / Your electrician has arrived.',
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'nuwwbdue' /* Stop journey */,
                        ),
                        options: FFButtonOptions(
                          height: 35.6,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Container(
            width: 442.3,
            height: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (widget!.serviceRequest?.dispatchAuthorized == true)
                    Flexible(
                      child: Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await ServiceRequestsTable().update(
                              data: {
                                'status': 'in_progress',
                                'start_time': getCurrentTimestamp.toString(),
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'assigned_electrician_uuid',
                                currentUserUid,
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'L\'intervention a commencée / Job started',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            _model.updatePage(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            '1qp4w893' /* Start job */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
                        ),
                      ),
                    ),
                  if (widget!.serviceRequest?.dispatchAuthorized == true)
                    Flexible(
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await ServiceRequestsTable().update(
                              data: {
                                'status': 'completed',
                                'completion_time': valueOrDefault<String>(
                                  getCurrentTimestamp.toString(),
                                  'NOW',
                                ),
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'id',
                                widget!.serviceRequest?.id,
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Intervention terminée / Job marked complete',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            await actions.notifyUser(
                            widget!.serviceRequest?.customerUuid,
                            'Intervention terminée / Job completed',
                            'L\'intervention est terminée. / The job is completed.',
                          );

                            _model.updatePage(() {});

                            context.pushNamed(
                              ElectricianReportPageWidget.routeName,
                              queryParameters: {
                                'serviceRequestid': serializeParam(
                                  widget!.serviceRequest?.id,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: FFLocalizations.of(context).getText(
                            'x72no860' /* Mark complete */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                7.0, 0.0, 7.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (widget!.serviceRequest?.dispatchAuthorized == true)
            FFButtonWidget(
              onPressed: () async {
                await widget.onCancelpressed?.call();
              },
              text: FFLocalizations.of(context).getText(
                '5hbkcq5o' /* Cancel Job */,
              ),
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFFEF3943),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.montserrat(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
        ],
      ),
    );
  }
}
