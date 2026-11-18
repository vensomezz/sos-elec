import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'service_request_business_widget.dart' show ServiceRequestBusinessWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ServiceRequestBusinessModel
    extends FlutterFlowModel<ServiceRequestBusinessWidget> {
  ///  Local state fields for this component.

  String? selectedElectrician;

  String? phoNe;

  String? eMail;

  String? addRess;

  String? naMe;

  String? descripTion;

  String? selectedAddressText;

  List<String> photoUrls2 = [];
  void addToPhotoUrls2(String item) => photoUrls2.add(item);
  void removeFromPhotoUrls2(String item) => photoUrls2.remove(item);
  void removeAtIndexFromPhotoUrls2(int index) => photoUrls2.removeAt(index);
  void insertAtIndexInPhotoUrls2(int index, String item) =>
      photoUrls2.insert(index, item);
  void updatePhotoUrls2AtIndex(int index, Function(String) updateFn) =>
      photoUrls2[index] = updateFn(photoUrls2[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  bool isDataUploading_uploadedFileUrl2 = false;
  FFUploadedFile uploadedLocalFile_uploadedFileUrl2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UserSubscriptionsRow>? userSubQuery;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();

    textFieldFocusNode7?.dispose();
    textController7?.dispose();
  }
}
