import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _progress = prefs.getDouble('ff_progress') ?? _progress;
    });
    _safeInit(() {
      _doneWorkouts = prefs
              .getStringList('ff_doneWorkouts')
              ?.map((x) => x == 'true')
              .toList() ??
          _doneWorkouts;
    });
    _safeInit(() {
      _DoneWrokoutsNum = prefs.getInt('ff_DoneWrokoutsNum') ?? _DoneWrokoutsNum;
    });
    _safeInit(() {
      _weightsList =
          prefs.getStringList('ff_weightsList')?.map(double.parse).toList() ??
              _weightsList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  double _progress = 0.5;
  double get progress => _progress;
  set progress(double value) {
    _progress = value;
    prefs.setDouble('ff_progress', value);
  }

  List<bool> _doneWorkouts = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> get doneWorkouts => _doneWorkouts;
  set doneWorkouts(List<bool> value) {
    _doneWorkouts = value;
    prefs.setStringList(
        'ff_doneWorkouts', value.map((x) => x.toString()).toList());
  }

  void addToDoneWorkouts(bool value) {
    _doneWorkouts.add(value);
    prefs.setStringList(
        'ff_doneWorkouts', _doneWorkouts.map((x) => x.toString()).toList());
  }

  void removeFromDoneWorkouts(bool value) {
    _doneWorkouts.remove(value);
    prefs.setStringList(
        'ff_doneWorkouts', _doneWorkouts.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromDoneWorkouts(int index) {
    _doneWorkouts.removeAt(index);
    prefs.setStringList(
        'ff_doneWorkouts', _doneWorkouts.map((x) => x.toString()).toList());
  }

  void updateDoneWorkoutsAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    _doneWorkouts[index] = updateFn(_doneWorkouts[index]);
    prefs.setStringList(
        'ff_doneWorkouts', _doneWorkouts.map((x) => x.toString()).toList());
  }

  void insertAtIndexInDoneWorkouts(int index, bool value) {
    _doneWorkouts.insert(index, value);
    prefs.setStringList(
        'ff_doneWorkouts', _doneWorkouts.map((x) => x.toString()).toList());
  }

  int _DoneWrokoutsNum = 0;
  int get DoneWrokoutsNum => _DoneWrokoutsNum;
  set DoneWrokoutsNum(int value) {
    _DoneWrokoutsNum = value;
    prefs.setInt('ff_DoneWrokoutsNum', value);
  }

  List<double> _weightsList = [
    8.0,
    8.0,
    8.0,
    8.0,
    8.0,
    8.0,
    8.0,
    8.0,
    8.0,
    8.0,
    8.0,
    8.0,
    8.0,
    8.0,
    8.0
  ];
  List<double> get weightsList => _weightsList;
  set weightsList(List<double> value) {
    _weightsList = value;
    prefs.setStringList(
        'ff_weightsList', value.map((x) => x.toString()).toList());
  }

  void addToWeightsList(double value) {
    _weightsList.add(value);
    prefs.setStringList(
        'ff_weightsList', _weightsList.map((x) => x.toString()).toList());
  }

  void removeFromWeightsList(double value) {
    _weightsList.remove(value);
    prefs.setStringList(
        'ff_weightsList', _weightsList.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromWeightsList(int index) {
    _weightsList.removeAt(index);
    prefs.setStringList(
        'ff_weightsList', _weightsList.map((x) => x.toString()).toList());
  }

  void updateWeightsListAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    _weightsList[index] = updateFn(_weightsList[index]);
    prefs.setStringList(
        'ff_weightsList', _weightsList.map((x) => x.toString()).toList());
  }

  void insertAtIndexInWeightsList(int index, double value) {
    _weightsList.insert(index, value);
    prefs.setStringList(
        'ff_weightsList', _weightsList.map((x) => x.toString()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
