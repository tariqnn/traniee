// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MilestonesStruct extends FFFirebaseStruct {
  MilestonesStruct({
    DateTime? time,
    String? name,
    bool? status,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _time = time,
        _name = name,
        _status = status,
        super(firestoreUtilData);

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;
  bool hasTime() => _time != null;

  // "name" field.
  String? _name;
  String get name => _name ?? 'milestone';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  set status(bool? val) => _status = val;
  bool hasStatus() => _status != null;

  static MilestonesStruct fromMap(Map<String, dynamic> data) =>
      MilestonesStruct(
        time: data['time'] as DateTime?,
        name: data['name'] as String?,
        status: data['status'] as bool?,
      );

  static MilestonesStruct? maybeFromMap(dynamic data) => data is Map
      ? MilestonesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'time': _time,
        'name': _name,
        'status': _status,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.bool,
        ),
      }.withoutNulls;

  static MilestonesStruct fromSerializableMap(Map<String, dynamic> data) =>
      MilestonesStruct(
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'MilestonesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MilestonesStruct &&
        time == other.time &&
        name == other.name &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality().hash([time, name, status]);
}

MilestonesStruct createMilestonesStruct({
  DateTime? time,
  String? name,
  bool? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MilestonesStruct(
      time: time,
      name: name,
      status: status,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MilestonesStruct? updateMilestonesStruct(
  MilestonesStruct? milestones, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    milestones
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMilestonesStructData(
  Map<String, dynamic> firestoreData,
  MilestonesStruct? milestones,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (milestones == null) {
    return;
  }
  if (milestones.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && milestones.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final milestonesData = getMilestonesFirestoreData(milestones, forFieldValue);
  final nestedData = milestonesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = milestones.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMilestonesFirestoreData(
  MilestonesStruct? milestones, [
  bool forFieldValue = false,
]) {
  if (milestones == null) {
    return {};
  }
  final firestoreData = mapToFirestore(milestones.toMap());

  // Add any Firestore field values
  milestones.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMilestonesListFirestoreData(
  List<MilestonesStruct>? milestoness,
) =>
    milestoness?.map((e) => getMilestonesFirestoreData(e, true)).toList() ?? [];
