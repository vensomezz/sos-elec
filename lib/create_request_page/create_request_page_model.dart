import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'create_request_page_widget.dart' show CreateRequestPageWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateRequestPageModel extends FlutterFlowModel<CreateRequestPageWidget> {
  ///  Local state fields for this page.

  String? problemDescription;

  String? photoUrl;

  List<String> photoUrls = [];
  void addToPhotoUrls(String item) => photoUrls.add(item);
  void removeFromPhotoUrls(String item) => photoUrls.remove(item);
  void removeAtIndexFromPhotoUrls(int index) => photoUrls.removeAt(index);
  void insertAtIndexInPhotoUrls(int index, String item) =>
      photoUrls.insert(index, item);
  void updatePhotoUrlsAtIndex(int index, Function(String) updateFn) =>
      photoUrls[index] = updateFn(photoUrls[index]);

  String? selectedAddressId;

  String? selectedAddressText;

  /// urgent
  String requestType = 'urgent';

  DateTime? appointmentDate;

  /// Empêche le double envoi pendant l'enregistrement.
  bool isSubmitting = false;

  String? appointmentSlot;

  DateTime? appointmentStart;

  DateTime? appointmentEnd;

  ///  State fields for stateful widgets in this page.

  Stream<List<UsersRow>>? createRequestPageSupabaseStream;
  // Stores action output result for [Backend Call - Query Rows] action in CreateRequestPage widget.
  List<AddressesRow>? addressesQuery;
  DateTime? datePicked;
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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode9;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  Stream<List<AddressesRow>>? listViewSupabaseStream;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode10;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  bool isDataUploading_uploadDataDhr = false;
  FFUploadedFile uploadedLocalFile_uploadDataDhr =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataDhr = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ServiceRequestsRow? insertRow;

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

    textFieldFocusNode10?.dispose();
    textController10?.dispose();
  }
}
