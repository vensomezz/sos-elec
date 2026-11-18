import '/auth/base_auth_user_provider.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'ourprices_widget.dart' show OurpricesWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OurpricesModel extends FlutterFlowModel<OurpricesWidget> {
  ///  Local state fields for this page.

  bool isAnnual = true;

  String? selectedOfferid;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
