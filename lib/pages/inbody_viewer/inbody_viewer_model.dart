import '/flutter_flow/flutter_flow_util.dart';
import 'inbody_viewer_widget.dart' show InbodyViewerWidget;
import 'package:flutter/material.dart';

class InbodyViewerModel extends FlutterFlowModel<InbodyViewerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
