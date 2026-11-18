import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'electrician_report_page_widget.dart' show ElectricianReportPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ElectricianReportPageModel
    extends FlutterFlowModel<ElectricianReportPageWidget> {
  ///  Local state fields for this page.

  List<String> phoTosElec = [];
  void addToPhoTosElec(String item) => phoTosElec.add(item);
  void removeFromPhoTosElec(String item) => phoTosElec.remove(item);
  void removeAtIndexFromPhoTosElec(int index) => phoTosElec.removeAt(index);
  void insertAtIndexInPhoTosElec(int index, String item) =>
      phoTosElec.insert(index, item);
  void updatePhoTosElecAtIndex(int index, Function(String) updateFn) =>
      phoTosElec[index] = updateFn(phoTosElec[index]);

  double? materialsTotal;

  String? selectedRequestId;

  double? tempTotalprice;

  double hourlyRate = 50.0;

  double remainingAmount = 0.0;

  List<String> receiptsMaterials = [];
  void addToReceiptsMaterials(String item) => receiptsMaterials.add(item);
  void removeFromReceiptsMaterials(String item) =>
      receiptsMaterials.remove(item);
  void removeAtIndexFromReceiptsMaterials(int index) =>
      receiptsMaterials.removeAt(index);
  void insertAtIndexInReceiptsMaterials(int index, String item) =>
      receiptsMaterials.insert(index, item);
  void updateReceiptsMaterialsAtIndex(int index, Function(String) updateFn) =>
      receiptsMaterials[index] = updateFn(receiptsMaterials[index]);

  ///  State fields for stateful widgets in this page.

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
  bool isDataUploading_uploadData7h9 = false;
  FFUploadedFile uploadedLocalFile_uploadData7h9 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData7h9 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode9;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  bool isDataUploading_uploadDataJ8h = false;
  FFUploadedFile uploadedLocalFile_uploadDataJ8h =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataJ8h = '';

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ServiceRequestMaterialsRow>? materialsQuery;
  // Stores action output result for [Backend Call - API ( calculatejobfinancials)] action in Button widget.
  ApiCallResponse? apiResultz9p;

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

    textFieldFocusNode8?.dispose();
    textController8?.dispose();

    textFieldFocusNode9?.dispose();
    textController9?.dispose();
  }
}
