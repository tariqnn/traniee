import '/flutter_flow/flutter_flow_util.dart';
import 'health_page_widget.dart' show HealthPageWidget;
import 'package:flutter/material.dart';

class HealthPageModel extends FlutterFlowModel<HealthPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
