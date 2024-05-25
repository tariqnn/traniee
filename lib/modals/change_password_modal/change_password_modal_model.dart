import '/flutter_flow/flutter_flow_util.dart';
import 'change_password_modal_widget.dart' show ChangePasswordModalWidget;
import 'package:flutter/material.dart';

class ChangePasswordModalModel
    extends FlutterFlowModel<ChangePasswordModalWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
