import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class AppoinmetnsRecord extends FirestoreRecord {
  AppoinmetnsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "day" field.
  String? _day;
  String get day => _day ?? '';
  bool hasDay() => _day != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _name = snapshotData['name'] as String?;
    _day = snapshotData['day'] as String?;
    _time = snapshotData['time'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appoinmetns');

  static Stream<AppoinmetnsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppoinmetnsRecord.fromSnapshot(s));

  static Future<AppoinmetnsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppoinmetnsRecord.fromSnapshot(s));

  static AppoinmetnsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppoinmetnsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppoinmetnsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppoinmetnsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppoinmetnsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppoinmetnsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppoinmetnsRecordData({
  String? email,
  String? name,
  String? day,
  String? time,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'name': name,
      'day': day,
      'time': time,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppoinmetnsRecordDocumentEquality implements Equality<AppoinmetnsRecord> {
  const AppoinmetnsRecordDocumentEquality();

  @override
  bool equals(AppoinmetnsRecord? e1, AppoinmetnsRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.name == e2?.name &&
        e1?.day == e2?.day &&
        e1?.time == e2?.time &&
        e1?.image == e2?.image;
  }

  @override
  int hash(AppoinmetnsRecord? e) =>
      const ListEquality().hash([e?.email, e?.name, e?.day, e?.time, e?.image]);

  @override
  bool isValidKey(Object? o) => o is AppoinmetnsRecord;
}
