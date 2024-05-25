import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class MealPlans1Record extends FirestoreRecord {
  MealPlans1Record._(
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
  List<MealStruct>? _breakfast;
  List<MealStruct> get breakfast => _breakfast ?? const [];
  bool hasBreakfast() => _breakfast != null;

  // "lunch" field.
  List<MealStruct>? _lunch;
  List<MealStruct> get lunch => _lunch ?? const [];
  bool hasLunch() => _lunch != null;

  // "dinner" field.
  List<MealStruct>? _dinner;
  List<MealStruct> get dinner => _dinner ?? const [];
  bool hasDinner() => _dinner != null;

  // "snacks" field.
  List<MealStruct>? _snacks;
  List<MealStruct> get snacks => _snacks ?? const [];
  bool hasSnacks() => _snacks != null;

  void _initializeFields() {
    _planType = snapshotData['plan_type'] as String?;
    _breakfast = getStructList(
      snapshotData['breakfast'],
      MealStruct.fromMap,
    );
    _lunch = getStructList(
      snapshotData['lunch'],
      MealStruct.fromMap,
    );
    _dinner = getStructList(
      snapshotData['dinner'],
      MealStruct.fromMap,
    );
    _snacks = getStructList(
      snapshotData['snacks'],
      MealStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meal_plans_1');

  static Stream<MealPlans1Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MealPlans1Record.fromSnapshot(s));

  static Future<MealPlans1Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MealPlans1Record.fromSnapshot(s));

  static MealPlans1Record fromSnapshot(DocumentSnapshot snapshot) =>
      MealPlans1Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MealPlans1Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MealPlans1Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MealPlans1Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MealPlans1Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMealPlans1RecordData({
  String? planType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'plan_type': planType,
    }.withoutNulls,
  );

  return firestoreData;
}

class MealPlans1RecordDocumentEquality implements Equality<MealPlans1Record> {
  const MealPlans1RecordDocumentEquality();

  @override
  bool equals(MealPlans1Record? e1, MealPlans1Record? e2) {
    const listEquality = ListEquality();
    return e1?.planType == e2?.planType &&
        listEquality.equals(e1?.breakfast, e2?.breakfast) &&
        listEquality.equals(e1?.lunch, e2?.lunch) &&
        listEquality.equals(e1?.dinner, e2?.dinner) &&
        listEquality.equals(e1?.snacks, e2?.snacks);
  }

  @override
  int hash(MealPlans1Record? e) => const ListEquality()
      .hash([e?.planType, e?.breakfast, e?.lunch, e?.dinner, e?.snacks]);

  @override
  bool isValidKey(Object? o) => o is MealPlans1Record;
}
