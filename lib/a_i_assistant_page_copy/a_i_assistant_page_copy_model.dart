import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'a_i_assistant_page_copy_widget.dart' show AIAssistantPageCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AIAssistantPageCopyModel
    extends FlutterFlowModel<AIAssistantPageCopyWidget> {
  ///  Local state fields for this page.

  List<String> meSsages = [];
  void addToMeSsages(String item) => meSsages.add(item);
  void removeFromMeSsages(String item) => meSsages.remove(item);
  void removeAtIndexFromMeSsages(int index) => meSsages.removeAt(index);
  void insertAtIndexInMeSsages(int index, String item) =>
      meSsages.insert(index, item);
  void updateMeSsagesAtIndex(int index, Function(String) updateFn) =>
      meSsages[index] = updateFn(meSsages[index]);

  /// text
  String? text;

  /// role
  String? role;

  String messageTosend = '';

  String aiResponse = '';

  List<String> chatMessages = [];
  void addToChatMessages(String item) => chatMessages.add(item);
  void removeFromChatMessages(String item) => chatMessages.remove(item);
  void removeAtIndexFromChatMessages(int index) => chatMessages.removeAt(index);
  void insertAtIndexInChatMessages(int index, String item) =>
      chatMessages.insert(index, item);
  void updateChatMessagesAtIndex(int index, Function(String) updateFn) =>
      chatMessages[index] = updateFn(chatMessages[index]);

  String conversationid = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  bool listViewStartAtEndApplied = false;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (ai chat v two)] action in TextField widget.
  ApiCallResponse? apiResultbh7;
  // Stores action output result for [Backend Call - API (ai chat v two)] action in Button widget.
  ApiCallResponse? apiResultnxv;

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
