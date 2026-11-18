import '/backend/supabase/supabase.dart';
import '/components/service_requestadmin_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'adminpage_copy_widget.dart' show AdminpageCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminpageCopyModel extends FlutterFlowModel<AdminpageCopyWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<ServiceRequestsRow>>? adminpageCopySupabaseStream;
  // Stores action output result for [Backend Call - Query Rows] action in AdminpageCopy widget.
  List<ServiceRequestsRow>? serviceRequests;
  // Models for serviceRequestadmin dynamic component.
  late FlutterFlowDynamicModels<ServiceRequestadminModel>
      serviceRequestadminModels;

  @override
  void initState(BuildContext context) {
    serviceRequestadminModels =
        FlutterFlowDynamicModels(() => ServiceRequestadminModel());
  }

  @override
  void dispose() {
    serviceRequestadminModels.dispose();
  }
}
