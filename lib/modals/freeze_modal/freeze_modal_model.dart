import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'freeze_modal_widget.dart' show FreezeModalWidget;
import 'package:flutter/material.dart';

class FreezeModalModel extends FlutterFlowModel<FreezeModalWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  double? dropDownValue;
  FormFieldController<double>? dropDownValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
