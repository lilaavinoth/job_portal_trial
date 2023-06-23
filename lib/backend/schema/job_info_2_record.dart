import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobInfo2Record extends FirestoreRecord {
  JobInfo2Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "jobType" field.
  List<String>? _jobType;
  List<String> get jobType => _jobType ?? const [];
  bool hasJobType() => _jobType != null;

  // "jobSchedule" field.
  List<String>? _jobSchedule;
  List<String> get jobSchedule => _jobSchedule ?? const [];
  bool hasJobSchedule() => _jobSchedule != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _jobType = getDataList(snapshotData['jobType']);
    _jobSchedule = getDataList(snapshotData['jobSchedule']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('jobInfo_2')
          : FirebaseFirestore.instance.collectionGroup('jobInfo_2');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('jobInfo_2').doc();

  static Stream<JobInfo2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JobInfo2Record.fromSnapshot(s));

  static Future<JobInfo2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JobInfo2Record.fromSnapshot(s));

  static JobInfo2Record fromSnapshot(DocumentSnapshot snapshot) =>
      JobInfo2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JobInfo2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JobInfo2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JobInfo2Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JobInfo2Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJobInfo2RecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}
