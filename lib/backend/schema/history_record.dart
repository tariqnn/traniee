import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class HistoryRecord extends FirestoreRecord {
  HistoryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_history" field.
  List<HistoryRecordStruct>? _userHistory;
  List<HistoryRecordStruct> get userHistory => _userHistory ?? const [];
  bool hasUserHistory() => _userHistory != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "weight" field.
  List<double>? _weight;
  List<double> get weight => _weight ?? const [];
  bool hasWeight() => _weight != null;

  // "time" field.
  List<DateTime>? _time;
  List<DateTime> get time => _time ?? const [];
  bool hasTime() => _time != null;

  // "bmi" field.
  List<double>? _bmi;
  List<double> get bmi => _bmi ?? const [];
  bool hasBmi() => _bmi != null;

  void _initializeFields() {
    _userHistory = getStructList(
      snapshotData['user_history'],
      HistoryRecordStruct.fromMap,
    );
    _id = snapshotData['id'] as String?;
    _weight = getDataList(snapshotData['weight']);
    _time = getDataList(snapshotData['time']);
    _bmi = getDataList(snapshotData['bmi']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('History');

  static Stream<HistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HistoryRecord.fromSnapshot(s));

  static Future<HistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HistoryRecord.fromSnapshot(s));

  static HistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHistoryRecordData({
  String? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class HistoryRecordDocumentEquality implements Equality<HistoryRecord> {
  const HistoryRecordDocumentEquality();

  @override
  bool equals(HistoryRecord? e1, HistoryRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.userHistory, e2?.userHistory) &&
        e1?.id == e2?.id &&
        listEquality.equals(e1?.weight, e2?.weight) &&
        listEquality.equals(e1?.time, e2?.time) &&
        listEquality.equals(e1?.bmi, e2?.bmi);
  }

  @override
  int hash(HistoryRecord? e) => const ListEquality()
      .hash([e?.userHistory, e?.id, e?.weight, e?.time, e?.bmi]);

  @override
  bool isValidKey(Object? o) => o is HistoryRecord;
}
