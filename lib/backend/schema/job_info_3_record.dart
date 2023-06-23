import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobInfo3Record extends FirestoreRecord {
  JobInfo3Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _payType = snapshotData['payType'] as String?;
    _min = castToType<int>(snapshotData['min']);
    _max = castToType<int>(snapshotData['max']);
    _amount = castToType<int>(snapshotData['amount']);
    _supplementalPay = getDataList(snapshotData['supplementalPay']);
    _benefits = getDataList(snapshotData['benefits']);
    _minMaxRate = snapshotData['minMaxRate'] as String?;
    _amountRate = snapshotData['amountRate'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('jobInfo_3')
          : FirebaseFirestore.instance.collectionGroup('jobInfo_3');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('jobInfo_3').doc();

  static Stream<JobInfo3Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JobInfo3Record.fromSnapshot(s));

  static Future<JobInfo3Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JobInfo3Record.fromSnapshot(s));

  static JobInfo3Record fromSnapshot(DocumentSnapshot snapshot) =>
      JobInfo3Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JobInfo3Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JobInfo3Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JobInfo3Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JobInfo3Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJobInfo3RecordData({
  String? payType,
  int? min,
  int? max,
  int? amount,
  String? minMaxRate,
  String? amountRate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'payType': payType,
      'min': min,
      'max': max,
      'amount': amount,
      'minMaxRate': minMaxRate,
      'amountRate': amountRate,
    }.withoutNulls,
  );

  return firestoreData;
}
