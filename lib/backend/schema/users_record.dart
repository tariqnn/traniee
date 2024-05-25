import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "t_dob" field.
  DateTime? _tDob;
  DateTime? get tDob => _tDob;
  bool hasTDob() => _tDob != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  bool hasHeight() => _height != null;

  // "bmi" field.
  double? _bmi;
  double get bmi => _bmi ?? 0.0;
  bool hasBmi() => _bmi != null;

  // "bmi_pdf" field.
  String? _bmiPdf;
  String get bmiPdf => _bmiPdf ?? '';
  bool hasBmiPdf() => _bmiPdf != null;

  // "gender" field.
  bool? _gender;
  bool get gender => _gender ?? false;
  bool hasGender() => _gender != null;

  // "sub_type" field.
  String? _subType;
  String get subType => _subType ?? '';
  bool hasSubType() => _subType != null;

  // "sub_status" field.
  String? _subStatus;
  String get subStatus => _subStatus ?? '';
  bool hasSubStatus() => _subStatus != null;

  // "sub_start_date" field.
  DateTime? _subStartDate;
  DateTime? get subStartDate => _subStartDate;
  bool hasSubStartDate() => _subStartDate != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  bool hasPoints() => _points != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "registered_classes" field.
  List<DocumentReference>? _registeredClasses;
  List<DocumentReference> get registeredClasses =>
      _registeredClasses ?? const [];
  bool hasRegisteredClasses() => _registeredClasses != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "workout_type" field.
  String? _workoutType;
  String get workoutType => _workoutType ?? '';
  bool hasWorkoutType() => _workoutType != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "sub_duration" field.
  double? _subDuration;
  double get subDuration => _subDuration ?? 0.0;
  bool hasSubDuration() => _subDuration != null;

  // "meal_plan_type" field.
  String? _mealPlanType;
  String get mealPlanType => _mealPlanType ?? '';
  bool hasMealPlanType() => _mealPlanType != null;

  // "milestone" field.
  MilestonesStruct? _milestone;
  MilestonesStruct get milestone => _milestone ?? MilestonesStruct();
  bool hasMilestone() => _milestone != null;

  // "sets" field.
  int? _sets;
  int get sets => _sets ?? 0;
  bool hasSets() => _sets != null;

  // "reps" field.
  int? _reps;
  int get reps => _reps ?? 0;
  bool hasReps() => _reps != null;

  // "history" field.
  List<HistoryRecordStruct>? _history;
  List<HistoryRecordStruct> get history => _history ?? const [];
  bool hasHistory() => _history != null;

  void _initializeFields() {
    _tDob = snapshotData['t_dob'] as DateTime?;
    _height = castToType<double>(snapshotData['height']);
    _bmi = castToType<double>(snapshotData['bmi']);
    _bmiPdf = snapshotData['bmi_pdf'] as String?;
    _gender = snapshotData['gender'] as bool?;
    _subType = snapshotData['sub_type'] as String?;
    _subStatus = snapshotData['sub_status'] as String?;
    _subStartDate = snapshotData['sub_start_date'] as DateTime?;
    _points = castToType<int>(snapshotData['points']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _registeredClasses = getDataList(snapshotData['registered_classes']);
    _uid = snapshotData['uid'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _workoutType = snapshotData['workout_type'] as String?;
    _role = snapshotData['role'] as String?;
    _subDuration = castToType<double>(snapshotData['sub_duration']);
    _mealPlanType = snapshotData['meal_plan_type'] as String?;
    _milestone = MilestonesStruct.maybeFromMap(snapshotData['milestone']);
    _sets = castToType<int>(snapshotData['sets']);
    _reps = castToType<int>(snapshotData['reps']);
    _history = getStructList(
      snapshotData['history'],
      HistoryRecordStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  DateTime? tDob,
  double? height,
  double? bmi,
  String? bmiPdf,
  bool? gender,
  String? subType,
  String? subStatus,
  DateTime? subStartDate,
  int? points,
  DateTime? createdTime,
  String? uid,
  String? photoUrl,
  String? email,
  String? displayName,
  String? phoneNumber,
  String? workoutType,
  String? role,
  double? subDuration,
  String? mealPlanType,
  MilestonesStruct? milestone,
  int? sets,
  int? reps,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      't_dob': tDob,
      'height': height,
      'bmi': bmi,
      'bmi_pdf': bmiPdf,
      'gender': gender,
      'sub_type': subType,
      'sub_status': subStatus,
      'sub_start_date': subStartDate,
      'points': points,
      'created_time': createdTime,
      'uid': uid,
      'photo_url': photoUrl,
      'email': email,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'workout_type': workoutType,
      'role': role,
      'sub_duration': subDuration,
      'meal_plan_type': mealPlanType,
      'milestone': MilestonesStruct().toMap(),
      'sets': sets,
      'reps': reps,
    }.withoutNulls,
  );

  // Handle nested data for "milestone" field.
  addMilestonesStructData(firestoreData, milestone, 'milestone');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.tDob == e2?.tDob &&
        e1?.height == e2?.height &&
        e1?.bmi == e2?.bmi &&
        e1?.bmiPdf == e2?.bmiPdf &&
        e1?.gender == e2?.gender &&
        e1?.subType == e2?.subType &&
        e1?.subStatus == e2?.subStatus &&
        e1?.subStartDate == e2?.subStartDate &&
        e1?.points == e2?.points &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.registeredClasses, e2?.registeredClasses) &&
        e1?.uid == e2?.uid &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.workoutType == e2?.workoutType &&
        e1?.role == e2?.role &&
        e1?.subDuration == e2?.subDuration &&
        e1?.mealPlanType == e2?.mealPlanType &&
        e1?.milestone == e2?.milestone &&
        e1?.sets == e2?.sets &&
        e1?.reps == e2?.reps &&
        listEquality.equals(e1?.history, e2?.history);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.tDob,
        e?.height,
        e?.bmi,
        e?.bmiPdf,
        e?.gender,
        e?.subType,
        e?.subStatus,
        e?.subStartDate,
        e?.points,
        e?.createdTime,
        e?.registeredClasses,
        e?.uid,
        e?.photoUrl,
        e?.email,
        e?.displayName,
        e?.phoneNumber,
        e?.workoutType,
        e?.role,
        e?.subDuration,
        e?.mealPlanType,
        e?.milestone,
        e?.sets,
        e?.reps,
        e?.history
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
