import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'a_i_assistant_page_widget.dart' show AIAssistantPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AIAssistantPageModel extends FlutterFlowModel<AIAssistantPageWidget> {
  ///  Local state fields for this page.

  List<dynamic> meSsages = [];
  void addToMeSsages(dynamic item) => meSsages.add(item);
  void removeFromMeSsages(dynamic item) => meSsages.remove(item);
  void removeAtIndexFromMeSsages(int index) => meSsages.removeAt(index);
  void insertAtIndexInMeSsages(int index, dynamic item) =>
      meSsages.insert(index, item);
  void updateMeSsagesAtIndex(int index, Function(dynamic) updateFn) =>
      meSsages[index] = updateFn(meSsages[index]);

  /// text
  String? text;

  /// role
  String? role;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (AI Edge function)] action in Button widget.
  ApiCallResponse? apiResultxb9;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    listViewController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
