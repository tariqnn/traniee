import '/flutter_flow/flutter_flow_util.dart';
import 'nutrition_page_widget.dart' show NutritionPageWidget;
import 'package:flutter/material.dart';

class NutritionPageModel extends FlutterFlowModel<NutritionPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
