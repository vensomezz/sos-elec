import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'request_options_page_widget.dart' show RequestOptionsPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RequestOptionsPageModel
    extends FlutterFlowModel<RequestOptionsPageWidget> {
  ///  Local state fields for this page.

  bool firstTime = true;

  String selectedRole = 'Particulier';

  String parTiculier = 'Particulier';

  String entrePrise = 'Entreprise';

  String elecTricien = 'Electricien';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
