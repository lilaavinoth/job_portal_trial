import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FullJobRecord extends FirestoreRecord {
  FullJobRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "progress" field.
  int? _progress;
  int get progress => _progress ?? 0;
  bool hasProgress() => _progress != null;

  // "jobTitle" field.
  String? _jobTitle;
  String get jobTitle => _jobTitle ?? '';
  bool hasJobTitle() => _jobTitle != null;

  // "noToHire" field.
  String? _noToHire;
  String get noToHire => _noToHire ?? '';
  bool hasNoToHire() => _noToHire != null;

  // "jobLocation" field.
  String? _jobLocation;
  String get jobLocation => _jobLocation ?? '';
  bool hasJobLocation() => _jobLocation != null;

  // "ongoingNeed" field.
  bool? _ongoingNeed;
  bool get ongoingNeed => _ongoingNeed ?? false;
  bool hasOngoingNeed() => _ongoingNeed != null;

  // "jobType" field.
  List<String>? _jobType;
  List<String> get jobType => _jobType ?? const [];
  bool hasJobType() => _jobType != null;

  // "jobSchedule" field.
  List<String>? _jobSchedule;
  List<String> get jobSchedule => _jobSchedule ?? const [];
  bool hasJobSchedule() => _jobSchedule != null;

  // "payType" field.
  String? _payType;
  String get payType => _payType ?? '';
  bool hasPayType() => _payType != null;

  // "min" field.
  int? _min;
  int get min => _min ?? 0;
  bool hasMin() => _min != null;

  // "max" field.
  int? _max;
  int get max => _max ?? 0;
  bool hasMax() => _max != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  // "supplementalPay" field.
  List<String>? _supplementalPay;
  List<String> get supplementalPay => _supplementalPay ?? const [];
  bool hasSupplementalPay() => _supplementalPay != null;

  // "benefits" field.
  List<String>? _benefits;
  List<String> get benefits => _benefits ?? const [];
  bool hasBenefits() => _benefits != null;

  // "minMaxRate" field.
  String? _minMaxRate;
  String get minMaxRate => _minMaxRate ?? '';
  bool hasMinMaxRate() => _minMaxRate != null;

  // "amountRate" field.
  String? _amountRate;
  String get amountRate => _amountRate ?? '';
  bool hasAmountRate() => _amountRate != null;

  // "mainJobDesc" field.
  String? _mainJobDesc;
  String get mainJobDesc => _mainJobDesc ?? '';
  bool hasMainJobDesc() => _mainJobDesc != null;

  // "submitResume" field.
  String? _submitResume;
  String get submitResume => _submitResume ?? '';
  bool hasSubmitResume() => _submitResume != null;

  // "criminalRecord" field.
  bool? _criminalRecord;
  bool get criminalRecord => _criminalRecord ?? false;
  bool hasCriminalRecord() => _criminalRecord != null;

  // "email_1" field.
  String? _email1;
  String get email1 => _email1 ?? '';
  bool hasEmail1() => _email1 != null;

  // "email_2" field.
  String? _email2;
  String get email2 => _email2 ?? '';
  bool hasEmail2() => _email2 != null;

  // "email_3" field.
  String? _email3;
  String get email3 => _email3 ?? '';
  bool hasEmail3() => _email3 != null;

  // "callDirect" field.
  int? _callDirect;
  int get callDirect => _callDirect ?? 0;
  bool hasCallDirect() => _callDirect != null;

  // "hireTimeline" field.
  String? _hireTimeline;
  String get hireTimeline => _hireTimeline ?? '';
  bool hasHireTimeline() => _hireTimeline != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _progress = castToType<int>(snapshotData['progress']);
    _jobTitle = snapshotData['jobTitle'] as String?;
    _noToHire = snapshotData['noToHire'] as String?;
    _jobLocation = snapshotData['jobLocation'] as String?;
    _ongoingNeed = snapshotData['ongoingNeed'] as bool?;
    _jobType = getDataList(snapshotData['jobType']);
    _jobSchedule = getDataList(snapshotData['jobSchedule']);
    _payType = snapshotData['payType'] as String?;
    _min = castToType<int>(snapshotData['min']);
    _max = castToType<int>(snapshotData['max']);
    _amount = castToType<int>(snapshotData['amount']);
    _supplementalPay = getDataList(snapshotData['supplementalPay']);
    _benefits = getDataList(snapshotData['benefits']);
    _minMaxRate = snapshotData['minMaxRate'] as String?;
    _amountRate = snapshotData['amountRate'] as String?;
    _mainJobDesc = snapshotData['mainJobDesc'] as String?;
    _submitResume = snapshotData['submitResume'] as String?;
    _criminalRecord = snapshotData['criminalRecord'] as bool?;
    _email1 = snapshotData['email_1'] as String?;
    _email2 = snapshotData['email_2'] as String?;
    _email3 = snapshotData['email_3'] as String?;
    _callDirect = castToType<int>(snapshotData['callDirect']);
    _hireTimeline = snapshotData['hireTimeline'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('fullJob')
          : FirebaseFirestore.instance.collectionGroup('fullJob');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('fullJob').doc();

  static Stream<FullJobRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FullJobRecord.fromSnapshot(s));

  static Future<FullJobRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FullJobRecord.fromSnapshot(s));

  static FullJobRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FullJobRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FullJobRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FullJobRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FullJobRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FullJobRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFullJobRecordData({
  int? progress,
  String? jobTitle,
  String? noToHire,
  String? jobLocation,
  bool? ongoingNeed,
  String? payType,
  int? min,
  int? max,
  int? amount,
  String? minMaxRate,
  String? amountRate,
  String? mainJobDesc,
  String? submitResume,
  bool? criminalRecord,
  String? email1,
  String? email2,
  String? email3,
  int? callDirect,
  String? hireTimeline,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'progress': progress,
      'jobTitle': jobTitle,
      'noToHire': noToHire,
      'jobLocation': jobLocation,
      'ongoingNeed': ongoingNeed,
      'payType': payType,
      'min': min,
      'max': max,
      'amount': amount,
      'minMaxRate': minMaxRate,
      'amountRate': amountRate,
      'mainJobDesc': mainJobDesc,
      'submitResume': submitResume,
      'criminalRecord': criminalRecord,
      'email_1': email1,
      'email_2': email2,
      'email_3': email3,
      'callDirect': callDirect,
      'hireTimeline': hireTimeline,
    }.withoutNulls,
  );

  return firestoreData;
}
