import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobInfo1Record extends FirestoreRecord {
  JobInfo1Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "jobTitle" field.
  String? _jobTitle;
  String get jobTitle => _jobTitle ?? '';
  bool hasJobTitle() => _jobTitle != null;

  // "notoHire" field.
  String? _notoHire;
  String get notoHire => _notoHire ?? '';
  bool hasNotoHire() => _notoHire != null;

  // "jobLocation" field.
  String? _jobLocation;
  String get jobLocation => _jobLocation ?? '';
  bool hasJobLocation() => _jobLocation != null;

  // "ongoingNeed" field.
  bool? _ongoingNeed;
  bool get ongoingNeed => _ongoingNeed ?? false;
  bool hasOngoingNeed() => _ongoingNeed != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _jobTitle = snapshotData['jobTitle'] as String?;
    _notoHire = snapshotData['notoHire'] as String?;
    _jobLocation = snapshotData['jobLocation'] as String?;
    _ongoingNeed = snapshotData['ongoingNeed'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('jobInfo_1')
          : FirebaseFirestore.instance.collectionGroup('jobInfo_1');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('jobInfo_1').doc();

  static Stream<JobInfo1Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JobInfo1Record.fromSnapshot(s));

  static Future<JobInfo1Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JobInfo1Record.fromSnapshot(s));

  static JobInfo1Record fromSnapshot(DocumentSnapshot snapshot) =>
      JobInfo1Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JobInfo1Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JobInfo1Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JobInfo1Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JobInfo1Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJobInfo1RecordData({
  String? jobTitle,
  String? notoHire,
  String? jobLocation,
  bool? ongoingNeed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'jobTitle': jobTitle,
      'notoHire': notoHire,
      'jobLocation': jobLocation,
      'ongoingNeed': ongoingNeed,
    }.withoutNulls,
  );

  return firestoreData;
}
