import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'create_guest_request_page_widget.dart'
    show CreateGuestRequestPageWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateGuestRequestPageModel
    extends FlutterFlowModel<CreateGuestRequestPageWidget> {
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

  String requestType = 'urgent';

  String? appointmentSlot;

  DateTime? appointmentDate;

  /// Empêche le double envoi pendant l'enregistrement.
  bool isSubmitting = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in CreateGuestRequestPage widget.
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
  // State field(s) for Textfield widget.
  FocusNode? textfieldFocusNode;
  TextEditingController? textfieldTextController;
  String? Function(BuildContext, String?)? textfieldTextControllerValidator;
  bool isDataUploading_uploadedFileUrl = false;
  FFUploadedFile uploadedLocalFile_uploadedFileUrl =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ServiceRequestsRow>? existingAppointments;
  // Stores action output result for [Backend Call - API (Create guest request)] action in Button widget.
  ApiCallResponse? createdGuestRequest;

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

    textfieldFocusNode?.dispose();
    textfieldTextController?.dispose();
  }
}
