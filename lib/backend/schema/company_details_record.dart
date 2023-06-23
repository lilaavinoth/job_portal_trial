import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyDetailsRecord extends FirestoreRecord {
  CompanyDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "noEmployees" field.
  String? _noEmployees;
  String get noEmployees => _noEmployees ?? '';
  bool hasNoEmployees() => _noEmployees != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "phoneNo" field.
  int? _phoneNo;
  int get phoneNo => _phoneNo ?? 0;
  bool hasPhoneNo() => _phoneNo != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _companyName = snapshotData['companyName'] as String?;
    _noEmployees = snapshotData['noEmployees'] as String?;
    _name = snapshotData['name'] as String?;
    _phoneNo = castToType<int>(snapshotData['phoneNo']);
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('companyDetails')
          : FirebaseFirestore.instance.collectionGroup('companyDetails');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('companyDetails').doc();

  static Stream<CompanyDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyDetailsRecord.fromSnapshot(s));

  static Future<CompanyDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanyDetailsRecord.fromSnapshot(s));

  static CompanyDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyDetailsRecordData({
  String? companyName,
  String? noEmployees,
  String? name,
  int? phoneNo,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'companyName': companyName,
      'noEmployees': noEmployees,
      'name': name,
      'phoneNo': phoneNo,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}
