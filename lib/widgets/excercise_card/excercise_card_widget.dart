import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modals/demo_video/demo_video_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'excercise_card_model.dart';
export 'excercise_card_model.dart';

class ExcerciseCardWidget extends StatefulWidget {
  const ExcerciseCardWidget({
    super.key,
    bool? isDone,
    required this.exName,
    this.sets,
    this.reps,
    double? duration,
    required this.video,
    required this.index,
  })  : isDone = isDone ?? false,
        duration = duration ?? 0.0;

  final bool isDone;
  final String? exName;
  final int? sets;
  final int? reps;
  final double duration;
  final String? video;
  final int? index;

  @override
  State<ExcerciseCardWidget> createState() => _ExcerciseCardWidgetState();
}

class _ExcerciseCardWidgetState extends State<ExcerciseCardWidget> {
  late ExcerciseCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExcerciseCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 100.0,
      height: 150.0,
      constraints: const BoxConstraints(
        minWidth: 350.0,
        maxWidth: 550.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.exName,
                    'workout',
                  ),
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Outfit',
                        letterSpacing: 0.0,
                      ),
                ),
                if (widget.duration == 0.0)
                  Text(
                    '${widget.sets?.toString()} sets | ${widget.reps?.toString()} reps | ${FFAppState().weightsList[widget.index!].toString()} kg',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                if (widget.duration > 0.0)
                  Text(
                    '${widget.duration.toString()} mins',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                if (widget.duration == 0.0)
                  FlutterFlowDropDown<double>(
                    controller: _model.dropDownValueController ??=
                        FormFieldController<double>(
                      _model.dropDownValue ??= 8.0,
                    ),
                    options: List<double>.from(
                        [8.0, 12.0, 16.0, 20.0, 24.0, 28.0, 32.0, 36.0, 40.0]),
                    optionLabels: [
                      FFLocalizations.of(context).getText(
                        'c7rvwbme' /* 8 kg */,
                      ),
                      FFLocalizations.of(context).getText(
                        'gndzsh8k' /* 12 kg */,
                      ),
                      FFLocalizations.of(context).getText(
                        'f5fik1hq' /* 16 kg */,
                      ),
                      FFLocalizations.of(context).getText(
                        'ir8fj10n' /* 20 kg */,
                      ),
                      FFLocalizations.of(context).getText(
                        '5wzw9bh4' /* 24 kg */,
                      ),
                      FFLocalizations.of(context).getText(
                        's3dizpo3' /* 28 kg */,
                      ),
                      FFLocalizations.of(context).getText(
                        'fpt58oe1' /* 32 kg */,
                      ),
                      FFLocalizations.of(context).getText(
                        'sshktmrr' /* 36 kg */,
                      ),
                      FFLocalizations.of(context).getText(
                        'ijyog83u' /* 40 kg */,
                      )
                    ],
                    onChanged: (val) async {
                      setState(() => _model.dropDownValue = val);
                      setState(() {
                        FFAppState().updateWeightsListAtIndex(
                          widget.index!,
                          (_) => _model.dropDownValue!,
                        );
                      });
                    },
                    width: 175.0,
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      '7j06s4yw' /* weight */,
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
              ],
            ),
            SizedBox(
              height: 120.0,
              child: VerticalDivider(
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).secondary,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'vgnb3gji' /* Done */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                    AuthUserStreamWidget(
                      builder: (context) => Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                        child: Checkbox(
                          value: _model.checkboxValue ??= widget.isDone,
                          onChanged: (valueOrDefault(
                                      currentUserDocument?.subStatus, '') ==
                                  'Freezed')
                              ? null
                              : (newValue) async {
                                  setState(
                                      () => _model.checkboxValue = newValue!);
                                  if (newValue!) {
                                    FFAppState().update(() {
                                      FFAppState().DoneWrokoutsNum =
                                          FFAppState().DoneWrokoutsNum + 1;
                                    });
                                    setState(() {
                                      FFAppState().updateDoneWorkoutsAtIndex(
                                        widget.index!,
                                        (_) => true,
                                      );
                                    });
                                  } else {
                                    FFAppState().update(() {
                                      FFAppState().DoneWrokoutsNum =
                                          FFAppState().DoneWrokoutsNum + -1;
                                    });
                                    setState(() {
                                      FFAppState().updateDoneWorkoutsAtIndex(
                                        widget.index!,
                                        (_) => false,
                                      );
                                    });
                                  }
                                },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: (valueOrDefault(
                                      currentUserDocument?.subStatus, '') ==
                                  'Freezed')
                              ? null
                              : FlutterFlowTheme.of(context).info,
                        ),
                      ),
                    ),
                  ],
                ),
                Builder(
                  builder: (context) => FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primary,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.ondemand_video,
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: const AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: WebViewAware(
                              child: DemoVideoWidget(
                                video: widget.video!,
                              ),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
