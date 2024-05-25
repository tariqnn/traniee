// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MealStruct extends FFFirebaseStruct {
  MealStruct({
    String? foodItem,
    double? calories,
    String? amount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _foodItem = foodItem,
        _calories = calories,
        _amount = amount,
        super(firestoreUtilData);

  // "food_item" field.
  String? _foodItem;
  String get foodItem => _foodItem ?? 'item';
  set foodItem(String? val) => _foodItem = val;
  bool hasFoodItem() => _foodItem != null;

  // "calories" field.
  double? _calories;
  double get calories => _calories ?? 10.0;
  set calories(double? val) => _calories = val;
  void incrementCalories(double amount) => _calories = calories + amount;
  bool hasCalories() => _calories != null;

  // "amount" field.
  String? _amount;
  String get amount => _amount ?? '20 grams';
  set amount(String? val) => _amount = val;
  bool hasAmount() => _amount != null;

  static MealStruct fromMap(Map<String, dynamic> data) => MealStruct(
        foodItem: data['food_item'] as String?,
        calories: castToType<double>(data['calories']),
        amount: data['amount'] as String?,
      );

  static MealStruct? maybeFromMap(dynamic data) =>
      data is Map ? MealStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'food_item': _foodItem,
        'calories': _calories,
        'amount': _amount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'food_item': serializeParam(
          _foodItem,
          ParamType.String,
        ),
        'calories': serializeParam(
          _calories,
          ParamType.double,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.String,
        ),
      }.withoutNulls;

  static MealStruct fromSerializableMap(Map<String, dynamic> data) =>
      MealStruct(
        foodItem: deserializeParam(
          data['food_item'],
          ParamType.String,
          false,
        ),
        calories: deserializeParam(
          data['calories'],
          ParamType.double,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MealStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MealStruct &&
        foodItem == other.foodItem &&
        calories == other.calories &&
        amount == other.amount;
  }

  @override
  int get hashCode => const ListEquality().hash([foodItem, calories, amount]);
}

MealStruct createMealStruct({
  String? foodItem,
  double? calories,
  String? amount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MealStruct(
      foodItem: foodItem,
      calories: calories,
      amount: amount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MealStruct? updateMealStruct(
  MealStruct? meal, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    meal
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMealStructData(
  Map<String, dynamic> firestoreData,
  MealStruct? meal,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (meal == null) {
    return;
  }
  if (meal.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && meal.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mealData = getMealFirestoreData(meal, forFieldValue);
  final nestedData = mealData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = meal.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMealFirestoreData(
  MealStruct? meal, [
  bool forFieldValue = false,
]) {
  if (meal == null) {
    return {};
  }
  final firestoreData = mapToFirestore(meal.toMap());

  // Add any Firestore field values
  meal.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMealListFirestoreData(
  List<MealStruct>? meals,
) =>
    meals?.map((e) => getMealFirestoreData(e, true)).toList() ?? [];
