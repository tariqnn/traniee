// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserExStruct extends FFFirebaseStruct {
  UserExStruct({
    String? exId,
    int? reps,
    int? sets,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _exId = exId,
        _reps = reps,
        _sets = sets,
        super(firestoreUtilData);

  // "ex_id" field.
  String? _exId;
  String get exId => _exId ?? '';
  set exId(String? val) => _exId = val;
  bool hasExId() => _exId != null;

  // "reps" field.
  int? _reps;
  int get reps => _reps ?? 0;
  set reps(int? val) => _reps = val;
  void incrementReps(int amount) => _reps = reps + amount;
  bool hasReps() => _reps != null;

  // "sets" field.
  int? _sets;
  int get sets => _sets ?? 0;
  set sets(int? val) => _sets = val;
  void incrementSets(int amount) => _sets = sets + amount;
  bool hasSets() => _sets != null;

  static UserExStruct fromMap(Map<String, dynamic> data) => UserExStruct(
        exId: data['ex_id'] as String?,
        reps: castToType<int>(data['reps']),
        sets: castToType<int>(data['sets']),
      );

  static UserExStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserExStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ex_id': _exId,
        'reps': _reps,
        'sets': _sets,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ex_id': serializeParam(
          _exId,
          ParamType.String,
        ),
        'reps': serializeParam(
          _reps,
          ParamType.int,
        ),
        'sets': serializeParam(
          _sets,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserExStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserExStruct(
        exId: deserializeParam(
          data['ex_id'],
          ParamType.String,
          false,
        ),
        reps: deserializeParam(
          data['reps'],
          ParamType.int,
          false,
        ),
        sets: deserializeParam(
          data['sets'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UserExStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserExStruct &&
        exId == other.exId &&
        reps == other.reps &&
        sets == other.sets;
  }

  @override
  int get hashCode => const ListEquality().hash([exId, reps, sets]);
}

UserExStruct createUserExStruct({
  String? exId,
  int? reps,
  int? sets,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserExStruct(
      exId: exId,
      reps: reps,
      sets: sets,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserExStruct? updateUserExStruct(
  UserExStruct? userEx, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userEx
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserExStructData(
  Map<String, dynamic> firestoreData,
  UserExStruct? userEx,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userEx == null) {
    return;
  }
  if (userEx.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userEx.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userExData = getUserExFirestoreData(userEx, forFieldValue);
  final nestedData = userExData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userEx.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserExFirestoreData(
  UserExStruct? userEx, [
  bool forFieldValue = false,
]) {
  if (userEx == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userEx.toMap());

  // Add any Firestore field values
  userEx.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserExListFirestoreData(
  List<UserExStruct>? userExs,
) =>
    userExs?.map((e) => getUserExFirestoreData(e, true)).toList() ?? [];
