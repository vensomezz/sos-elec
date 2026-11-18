import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/service_request_particulier_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'client_home_widget.dart' show ClientHomeWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClientHomeModel extends FlutterFlowModel<ClientHomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for serviceRequest_Particulier dynamic component.
  late FlutterFlowDynamicModels<ServiceRequestParticulierModel>
      serviceRequestParticulierModels;

  @override
  void initState(BuildContext context) {
    serviceRequestParticulierModels =
        FlutterFlowDynamicModels(() => ServiceRequestParticulierModel());
  }

  @override
  void dispose() {
    serviceRequestParticulierModels.dispose();
  }
}
