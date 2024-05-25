import '/flutter_flow/flutter_flow_util.dart';
import 'excercises_page_widget.dart' show ExcercisesPageWidget;
import 'package:flutter/material.dart';

class ExcercisesPageModel extends FlutterFlowModel<ExcercisesPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
