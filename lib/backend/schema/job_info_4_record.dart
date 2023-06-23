import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobInfo4Record extends FirestoreRecord {
  JobInfo4Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "mainJobDesc" field.
  String? _mainJobDesc;
  String get mainJobDesc => _mainJobDesc ?? '';
  bool hasMainJobDesc() => _mainJobDesc != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _mainJobDesc = snapshotData['mainJobDesc'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('jobInfo_4')
          : FirebaseFirestore.instance.collectionGroup('jobInfo_4');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('jobInfo_4').doc();

  static Stream<JobInfo4Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JobInfo4Record.fromSnapshot(s));

  static Future<JobInfo4Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JobInfo4Record.fromSnapshot(s));

  static JobInfo4Record fromSnapshot(DocumentSnapshot snapshot) =>
      JobInfo4Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JobInfo4Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JobInfo4Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JobInfo4Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JobInfo4Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJobInfo4RecordData({
  String? mainJobDesc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mainJobDesc': mainJobDesc,
    }.withoutNulls,
  );

  return firestoreData;
}
