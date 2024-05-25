// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistoryRecordStruct extends FFFirebaseStruct {
  HistoryRecordStruct({
    DateTime? time,
    double? weight,
    double? fatPercentage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _time = time,
        _weight = weight,
        _fatPercentage = fatPercentage,
        super(firestoreUtilData);

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;
  bool hasTime() => _time != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  set weight(double? val) => _weight = val;
  void incrementWeight(double amount) => _weight = weight + amount;
  bool hasWeight() => _weight != null;

  // "fatPercentage" field.
  double? _fatPercentage;
  double get fatPercentage => _fatPercentage ?? 0.0;
  set fatPercentage(double? val) => _fatPercentage = val;
  void incrementFatPercentage(double amount) =>
      _fatPercentage = fatPercentage + amount;
  bool hasFatPercentage() => _fatPercentage != null;

  static HistoryRecordStruct fromMap(Map<String, dynamic> data) =>
      HistoryRecordStruct(
        time: data['time'] as DateTime?,
        weight: castToType<double>(data['weight']),
        fatPercentage: castToType<double>(data['fatPercentage']),
      );

  static HistoryRecordStruct? maybeFromMap(dynamic data) => data is Map
      ? HistoryRecordStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'time': _time,
        'weight': _weight,
        'fatPercentage': _fatPercentage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.double,
        ),
        'fatPercentage': serializeParam(
          _fatPercentage,
          ParamType.double,
        ),
      }.withoutNulls;

  static HistoryRecordStruct fromSerializableMap(Map<String, dynamic> data) =>
      HistoryRecordStruct(
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.double,
          false,
        ),
        fatPercentage: deserializeParam(
          data['fatPercentage'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'HistoryRecordStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HistoryRecordStruct &&
        time == other.time &&
        weight == other.weight &&
        fatPercentage == other.fatPercentage;
  }

  @override
  int get hashCode => const ListEquality().hash([time, weight, fatPercentage]);
}

HistoryRecordStruct createHistoryRecordStruct({
  DateTime? time,
  double? weight,
  double? fatPercentage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HistoryRecordStruct(
      time: time,
      weight: weight,
      fatPercentage: fatPercentage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HistoryRecordStruct? updateHistoryRecordStruct(
  HistoryRecordStruct? historyRecord, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    historyRecord
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHistoryRecordStructData(
  Map<String, dynamic> firestoreData,
  HistoryRecordStruct? historyRecord,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (historyRecord == null) {
    return;
  }
  if (historyRecord.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && historyRecord.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final historyRecordData =
      getHistoryRecordFirestoreData(historyRecord, forFieldValue);
  final nestedData =
      historyRecordData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = historyRecord.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHistoryRecordFirestoreData(
  HistoryRecordStruct? historyRecord, [
  bool forFieldValue = false,
]) {
  if (historyRecord == null) {
    return {};
  }
  final firestoreData = mapToFirestore(historyRecord.toMap());

  // Add any Firestore field values
  historyRecord.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHistoryRecordListFirestoreData(
  List<HistoryRecordStruct>? historyRecords,
) =>
    historyRecords
        ?.map((e) => getHistoryRecordFirestoreData(e, true))
        .toList() ??
    [];
