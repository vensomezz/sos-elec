import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'job_details_page_widget.dart' show JobDetailsPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JobDetailsPageModel extends FlutterFlowModel<JobDetailsPageWidget> {
  ///  Local state fields for this page.

  UsersRow? selectedElectrician;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in JobDetailsPage widget.
  List<UsersRow>? electriciansList;
  // Stores action output result for [Backend Call - API (createdepositcheckout)] action in Button widget.
  ApiCallResponse? apiResult0ql;
  // Stores action output result for [Backend Call - API (createfinalcheckout)] action in Button widget.
  ApiCallResponse? apiResultn2q;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
