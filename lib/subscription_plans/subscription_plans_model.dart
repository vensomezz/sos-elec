import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'subscription_plans_widget.dart' show SubscriptionPlansWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubscriptionPlansModel extends FlutterFlowModel<SubscriptionPlansWidget> {
  ///  Local state fields for this page.

  bool isAnnual = true;

  String? selectedOfferid;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (Stripe createSubscriptionCheckout)] action in Button widget.
  ApiCallResponse? apiResult3yi;
  // Stores action output result for [Backend Call - API (Stripe createSubscriptionCheckout)] action in Button widget.
  ApiCallResponse? apiResultlcb;
  // Stores action output result for [Backend Call - API (Stripe createSubscriptionCheckout)] action in Button widget.
  ApiCallResponse? apiResultz55;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
