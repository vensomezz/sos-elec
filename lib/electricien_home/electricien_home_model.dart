import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/cancel_job_dialog_widget.dart';
import '/components/service_request_electrician_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'electricien_home_widget.dart' show ElectricienHomeWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ElectricienHomeModel extends FlutterFlowModel<ElectricienHomeWidget> {
  ///  Local state fields for this page.

  double? currentLat;

  double? currentLng;

  bool showCancelDialog = true;

  ServiceRequestsRow? selectedServiceRequest;

  bool showRefuseDialog = true;

  ///  State fields for stateful widgets in this page.

  // Models for serviceRequest_Electrician dynamic component.
  late FlutterFlowDynamicModels<ServiceRequestElectricianModel>
      serviceRequestElectricianModels;
  // Model for CancelJobDialog component.
  late CancelJobDialogModel cancelJobDialogModel;

  @override
  void initState(BuildContext context) {
    serviceRequestElectricianModels =
        FlutterFlowDynamicModels(() => ServiceRequestElectricianModel());
    cancelJobDialogModel = createModel(context, () => CancelJobDialogModel());
  }

  @override
  void dispose() {
    serviceRequestElectricianModels.dispose();
    cancelJobDialogModel.dispose();
  }
}
