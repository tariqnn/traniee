import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClassesRecord extends FirestoreRecord {
  ClassesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "c_name" field.
  String? _cName;
  String get cName => _cName ?? '';
  bool hasCName() => _cName != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "cap" field.
  int? _cap;
  int get cap => _cap ?? 0;
  bool hasCap() => _cap != null;

  // "participants" field.
  int? _participants;
  int get participants => _participants ?? 0;
  bool hasParticipants() => _participants != null;

  // "instructor" field.
  String? _instructor;
  String get instructor => _instructor ?? '';
  bool hasInstructor() => _instructor != null;

  // "c_picture" field.
  String? _cPicture;
  String get cPicture => _cPicture ?? '';
  bool hasCPicture() => _cPicture != null;

  void _initializeFields() {
    _cName = snapshotData['c_name'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _cap = castToType<int>(snapshotData['cap']);
    _participants = castToType<int>(snapshotData['participants']);
    _instructor = snapshotData['instructor'] as String?;
    _cPicture = snapshotData['c_picture'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Classes');

  static Stream<ClassesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClassesRecord.fromSnapshot(s));

  static Future<ClassesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClassesRecord.fromSnapshot(s));

  static ClassesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClassesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClassesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClassesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClassesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClassesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClassesRecordData({
  String? cName,
  DateTime? time,
  int? cap,
  int? participants,
  String? instructor,
  String? cPicture,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'c_name': cName,
      'time': time,
      'cap': cap,
      'participants': participants,
      'instructor': instructor,
      'c_picture': cPicture,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClassesRecordDocumentEquality implements Equality<ClassesRecord> {
  const ClassesRecordDocumentEquality();

  @override
  bool equals(ClassesRecord? e1, ClassesRecord? e2) {
    return e1?.cName == e2?.cName &&
        e1?.time == e2?.time &&
        e1?.cap == e2?.cap &&
        e1?.participants == e2?.participants &&
        e1?.instructor == e2?.instructor &&
        e1?.cPicture == e2?.cPicture;
  }

  @override
  int hash(ClassesRecord? e) => const ListEquality().hash(
      [e?.cName, e?.time, e?.cap, e?.participants, e?.instructor, e?.cPicture]);

  @override
  bool isValidKey(Object? o) => o is ClassesRecord;
}
