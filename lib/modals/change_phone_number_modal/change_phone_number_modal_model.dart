import '/flutter_flow/flutter_flow_util.dart';
import 'change_phone_number_modal_widget.dart'
    show ChangePhoneNumberModalWidget;
import 'package:flutter/material.dart';

class ChangePhoneNumberModalModel
    extends FlutterFlowModel<ChangePhoneNumberModalWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();
  }
}
