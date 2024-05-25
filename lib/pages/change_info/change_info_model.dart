import '/flutter_flow/flutter_flow_util.dart';
import 'change_info_widget.dart' show ChangeInfoWidget;
import 'package:flutter/material.dart';

class ChangeInfoModel extends FlutterFlowModel<ChangeInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
