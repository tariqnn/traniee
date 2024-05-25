import '/flutter_flow/flutter_flow_util.dart';
import 'subscription_plans_widget.dart' show SubscriptionPlansWidget;
import 'package:flutter/material.dart';

class SubscriptionPlansModel extends FlutterFlowModel<SubscriptionPlansWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
