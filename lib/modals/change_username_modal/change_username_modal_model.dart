import '/flutter_flow/flutter_flow_util.dart';
import 'change_username_modal_widget.dart' show ChangeUsernameModalWidget;
import 'package:flutter/material.dart';

class ChangeUsernameModalModel
    extends FlutterFlowModel<ChangeUsernameModalWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameTextController;
  String? Function(BuildContext, String?)? usernameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    usernameFocusNode?.dispose();
    usernameTextController?.dispose();
  }
}
