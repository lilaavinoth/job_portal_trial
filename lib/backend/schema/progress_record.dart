import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgressRecord extends FirestoreRecord {
  ProgressRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "inProgress" field.
  int? _inProgress;
  int get inProgress => _inProgress ?? 0;
  bool hasInProgress() => _inProgress != null;

  // "jobsCompleted" field.
  int? _jobsCompleted;
  int get jobsCompleted => _jobsCompleted ?? 0;
  bool hasJobsCompleted() => _jobsCompleted != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _inProgress = castToType<int>(snapshotData['inProgress']);
    _jobsCompleted = castToType<int>(snapshotData['jobsCompleted']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('progress')
          : FirebaseFirestore.instance.collectionGroup('progress');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('progress').doc();

  static Stream<ProgressRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProgressRecord.fromSnapshot(s));

  static Future<ProgressRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProgressRecord.fromSnapshot(s));

  static ProgressRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProgressRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProgressRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProgressRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProgressRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProgressRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProgressRecordData({
  int? inProgress,
  int? jobsCompleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'inProgress': inProgress,
      'jobsCompleted': jobsCompleted,
    }.withoutNulls,
  );

  return firestoreData;
}
