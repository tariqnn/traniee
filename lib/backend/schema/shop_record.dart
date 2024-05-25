import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShopRecord extends FirestoreRecord {
  ShopRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "item" field.
  String? _item;
  String get item => _item ?? '';
  bool hasItem() => _item != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  bool hasPoints() => _points != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "ItemPhoto" field.
  String? _itemPhoto;
  String get itemPhoto => _itemPhoto ?? '';
  bool hasItemPhoto() => _itemPhoto != null;

  void _initializeFields() {
    _item = snapshotData['item'] as String?;
    _points = castToType<int>(snapshotData['points']);
    _price = castToType<double>(snapshotData['price']);
    _itemPhoto = snapshotData['ItemPhoto'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shop');

  static Stream<ShopRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShopRecord.fromSnapshot(s));

  static Future<ShopRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShopRecord.fromSnapshot(s));

  static ShopRecord fromSnapshot(DocumentSnapshot snapshot) => ShopRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShopRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShopRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShopRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShopRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShopRecordData({
  String? item,
  int? points,
  double? price,
  String? itemPhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'item': item,
      'points': points,
      'price': price,
      'ItemPhoto': itemPhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShopRecordDocumentEquality implements Equality<ShopRecord> {
  const ShopRecordDocumentEquality();

  @override
  bool equals(ShopRecord? e1, ShopRecord? e2) {
    return e1?.item == e2?.item &&
        e1?.points == e2?.points &&
        e1?.price == e2?.price &&
        e1?.itemPhoto == e2?.itemPhoto;
  }

  @override
  int hash(ShopRecord? e) =>
      const ListEquality().hash([e?.item, e?.points, e?.price, e?.itemPhoto]);

  @override
  bool isValidKey(Object? o) => o is ShopRecord;
}
