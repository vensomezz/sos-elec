import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'depositcheckoutsuccess_widget.dart' show DepositcheckoutsuccessWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DepositcheckoutsuccessModel
    extends FlutterFlowModel<DepositcheckoutsuccessWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in depositcheckoutsuccess widget.
  List<UserSubscriptionsRow>? subscriptionQuery;
  // Stores action output result for [Backend Call - Query Rows] action in depositcheckoutsuccess widget.
  List<UserSubscriptionsRow>? subscriptionRetry;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
