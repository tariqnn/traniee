import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class MealPlan2Record extends FirestoreRecord {
  MealPlan2Record._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "plan_type" field.
  String? _planType;
  String get planType => _planType ?? '';
  bool hasPlanType() => _planType != null;

  // "breakfast" field.
  MealStruct? _breakfast;
  MealStruct get breakfast => _breakfast ?? MealStruct();
  bool hasBreakfast() => _breakfast != null;

  // "lunch" field.
  MealStruct? _lunch;
  MealStruct get lunch => _lunch ?? MealStruct();
  bool hasLunch() => _lunch != null;

  // "dinner" field.
  MealStruct? _dinner;
  MealStruct get dinner => _dinner ?? MealStruct();
  bool hasDinner() => _dinner != null;

  // "snack" field.
  MealStruct? _snack;
  MealStruct get snack => _snack ?? MealStruct();
  bool hasSnack() => _snack != null;

  void _initializeFields() {
    _planType = snapshotData['plan_type'] as String?;
    _breakfast = MealStruct.maybeFromMap(snapshotData['breakfast']);
    _lunch = MealStruct.maybeFromMap(snapshotData['lunch']);
    _dinner = MealStruct.maybeFromMap(snapshotData['dinner']);
    _snack = MealStruct.maybeFromMap(snapshotData['snack']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meal_plan2');

  static Stream<MealPlan2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MealPlan2Record.fromSnapshot(s));

  static Future<MealPlan2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MealPlan2Record.fromSnapshot(s));

  static MealPlan2Record fromSnapshot(DocumentSnapshot snapshot) =>
      MealPlan2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MealPlan2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MealPlan2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MealPlan2Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MealPlan2Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMealPlan2RecordData({
  String? planType,
  MealStruct? breakfast,
  MealStruct? lunch,
  MealStruct? dinner,
  MealStruct? snack,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'plan_type': planType,
      'breakfast': MealStruct().toMap(),
      'lunch': MealStruct().toMap(),
      'dinner': MealStruct().toMap(),
      'snack': MealStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "breakfast" field.
  addMealStructData(firestoreData, breakfast, 'breakfast');

  // Handle nested data for "lunch" field.
  addMealStructData(firestoreData, lunch, 'lunch');

  // Handle nested data for "dinner" field.
  addMealStructData(firestoreData, dinner, 'dinner');

  // Handle nested data for "snack" field.
  addMealStructData(firestoreData, snack, 'snack');

  return firestoreData;
}

class MealPlan2RecordDocumentEquality implements Equality<MealPlan2Record> {
  const MealPlan2RecordDocumentEquality();

  @override
  bool equals(MealPlan2Record? e1, MealPlan2Record? e2) {
    return e1?.planType == e2?.planType &&
        e1?.breakfast == e2?.breakfast &&
        e1?.lunch == e2?.lunch &&
        e1?.dinner == e2?.dinner &&
        e1?.snack == e2?.snack;
  }

  @override
  int hash(MealPlan2Record? e) => const ListEquality()
      .hash([e?.planType, e?.breakfast, e?.lunch, e?.dinner, e?.snack]);

  @override
  bool isValidKey(Object? o) => o is MealPlan2Record;
}
