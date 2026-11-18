import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/service_request_business_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'business_home_page_widget.dart' show BusinessHomePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BusinessHomePageModel extends FlutterFlowModel<BusinessHomePageWidget> {
  ///  Local state fields for this page.

  int? newCreditsUsed;

  int? remainingCredits;

  ///  State fields for stateful widgets in this page.

  // Models for serviceRequest_Business dynamic component.
  late FlutterFlowDynamicModels<ServiceRequestBusinessModel>
      serviceRequestBusinessModels;

  @override
  void initState(BuildContext context) {
    serviceRequestBusinessModels =
        FlutterFlowDynamicModels(() => ServiceRequestBusinessModel());
  }

  @override
  void dispose() {
    serviceRequestBusinessModels.dispose();
  }
}
