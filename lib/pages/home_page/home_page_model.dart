import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/page_card/page_card_widget.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for pageCard component.
  late PageCardModel pageCardModel;

  @override
  void initState(BuildContext context) {
    pageCardModel = createModel(context, () => PageCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pageCardModel.dispose();
  }
}
