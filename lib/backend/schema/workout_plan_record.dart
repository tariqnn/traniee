import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkoutPlanRecord extends FirestoreRecord {
  WorkoutPlanRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ex_name" field.
  String? _exName;
  String get exName => _exName ?? '';
  bool hasExName() => _exName != null;

  // "ex_type" field.
  String? _exType;
  String get exType => _exType ?? '';
  bool hasExType() => _exType != null;

  // "ex_intensity" field.
  String? _exIntensity;
  String get exIntensity => _exIntensity ?? '';
  bool hasExIntensity() => _exIntensity != null;

  // "plan_type" field.
  String? _planType;
  String get planType => _planType ?? '';
  bool hasPlanType() => _planType != null;

  // "demo_video" field.
  String? _demoVideo;
  String get demoVideo => _demoVideo ?? '';
  bool hasDemoVideo() => _demoVideo != null;

  // "sets" field.
  int? _sets;
  int get sets => _sets ?? 0;
  bool hasSets() => _sets != null;

  // "reps" field.
  int? _reps;
  int get reps => _reps ?? 0;
  bool hasReps() => _reps != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  // "duration" field.
  double? _duration;
  double get duration => _duration ?? 0.0;
  bool hasDuration() => _duration != null;

  // "body_section" field.
  int? _bodySection;
  int get bodySection => _bodySection ?? 0;
  bool hasBodySection() => _bodySection != null;

  void _initializeFields() {
    _exName = snapshotData['ex_name'] as String?;
    _exType = snapshotData['ex_type'] as String?;
    _exIntensity = snapshotData['ex_intensity'] as String?;
    _planType = snapshotData['plan_type'] as String?;
    _demoVideo = snapshotData['demo_video'] as String?;
    _sets = castToType<int>(snapshotData['sets']);
    _reps = castToType<int>(snapshotData['reps']);
    _weight = castToType<double>(snapshotData['weight']);
    _duration = castToType<double>(snapshotData['duration']);
    _bodySection = castToType<int>(snapshotData['body_section']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('workout_plan');

  static Stream<WorkoutPlanRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkoutPlanRecord.fromSnapshot(s));

  static Future<WorkoutPlanRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkoutPlanRecord.fromSnapshot(s));

  static WorkoutPlanRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkoutPlanRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkoutPlanRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkoutPlanRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkoutPlanRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkoutPlanRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkoutPlanRecordData({
  String? exName,
  String? exType,
  String? exIntensity,
  String? planType,
  String? demoVideo,
  int? sets,
  int? reps,
  double? weight,
  double? duration,
  int? bodySection,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ex_name': exName,
      'ex_type': exType,
      'ex_intensity': exIntensity,
      'plan_type': planType,
      'demo_video': demoVideo,
      'sets': sets,
      'reps': reps,
      'weight': weight,
      'duration': duration,
      'body_section': bodySection,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkoutPlanRecordDocumentEquality implements Equality<WorkoutPlanRecord> {
  const WorkoutPlanRecordDocumentEquality();

  @override
  bool equals(WorkoutPlanRecord? e1, WorkoutPlanRecord? e2) {
    return e1?.exName == e2?.exName &&
        e1?.exType == e2?.exType &&
        e1?.exIntensity == e2?.exIntensity &&
        e1?.planType == e2?.planType &&
        e1?.demoVideo == e2?.demoVideo &&
        e1?.sets == e2?.sets &&
        e1?.reps == e2?.reps &&
        e1?.weight == e2?.weight &&
        e1?.duration == e2?.duration &&
        e1?.bodySection == e2?.bodySection;
  }

  @override
  int hash(WorkoutPlanRecord? e) => const ListEquality().hash([
        e?.exName,
        e?.exType,
        e?.exIntensity,
        e?.planType,
        e?.demoVideo,
        e?.sets,
        e?.reps,
        e?.weight,
        e?.duration,
        e?.bodySection
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkoutPlanRecord;
}
