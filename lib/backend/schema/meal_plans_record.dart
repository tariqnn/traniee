import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MealPlansRecord extends FirestoreRecord {
  MealPlansRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "meal_type" field.
  String? _mealType;
  String get mealType => _mealType ?? '';
  bool hasMealType() => _mealType != null;

  // "food_item" field.
  String? _foodItem;
  String get foodItem => _foodItem ?? '';
  bool hasFoodItem() => _foodItem != null;

  // "food_amount" field.
  double? _foodAmount;
  double get foodAmount => _foodAmount ?? 0.0;
  bool hasFoodAmount() => _foodAmount != null;

  // "calories" field.
  double? _calories;
  double get calories => _calories ?? 0.0;
  bool hasCalories() => _calories != null;

  // "plan_type" field.
  String? _planType;
  String get planType => _planType ?? '';
  bool hasPlanType() => _planType != null;

  void _initializeFields() {
    _mealType = snapshotData['meal_type'] as String?;
    _foodItem = snapshotData['food_item'] as String?;
    _foodAmount = castToType<double>(snapshotData['food_amount']);
    _calories = castToType<double>(snapshotData['calories']);
    _planType = snapshotData['plan_type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meal_plans');

  static Stream<MealPlansRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MealPlansRecord.fromSnapshot(s));

  static Future<MealPlansRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MealPlansRecord.fromSnapshot(s));

  static MealPlansRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MealPlansRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MealPlansRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MealPlansRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MealPlansRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MealPlansRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMealPlansRecordData({
  String? mealType,
  String? foodItem,
  double? foodAmount,
  double? calories,
  String? planType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'meal_type': mealType,
      'food_item': foodItem,
      'food_amount': foodAmount,
      'calories': calories,
      'plan_type': planType,
    }.withoutNulls,
  );

  return firestoreData;
}

class MealPlansRecordDocumentEquality implements Equality<MealPlansRecord> {
  const MealPlansRecordDocumentEquality();

  @override
  bool equals(MealPlansRecord? e1, MealPlansRecord? e2) {
    return e1?.mealType == e2?.mealType &&
        e1?.foodItem == e2?.foodItem &&
        e1?.foodAmount == e2?.foodAmount &&
        e1?.calories == e2?.calories &&
        e1?.planType == e2?.planType;
  }

  @override
  int hash(MealPlansRecord? e) => const ListEquality().hash(
      [e?.mealType, e?.foodItem, e?.foodAmount, e?.calories, e?.planType]);

  @override
  bool isValidKey(Object? o) => o is MealPlansRecord;
}
