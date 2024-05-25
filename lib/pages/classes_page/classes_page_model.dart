import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/class_card/class_card_widget.dart';
import 'classes_page_widget.dart' show ClassesPageWidget;
import 'package:flutter/material.dart';

class ClassesPageModel extends FlutterFlowModel<ClassesPageWidget> {
  ///  Local state fields for this page.

  bool searchActive = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<ClassesRecord> simpleSearchResults = [];
  // Models for classCard dynamic component.
  late FlutterFlowDynamicModels<ClassCardModel> classCardModels1;
  // Models for classCard dynamic component.
  late FlutterFlowDynamicModels<ClassCardModel> classCardModels2;

  @override
  void initState(BuildContext context) {
    classCardModels1 = FlutterFlowDynamicModels(() => ClassCardModel());
    classCardModels2 = FlutterFlowDynamicModels(() => ClassCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();

    classCardModels1.dispose();
    classCardModels2.dispose();
  }
}
