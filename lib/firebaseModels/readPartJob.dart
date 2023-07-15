// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class readPartJob {
  final String? jobTitle;
  final String? notoHire;
  final bool? ongoingNeed;
  final String? jobLocation;
  final String? streetAddress;
  final List<String>? jobType;
  final List<String>? jobSchedule;
  final String? payType;
  final int? min;
  final int? max;
  final String? minMaxRate;
  final int? amount;
  final String? amountRate;
  final List<String>? supplementalPay;
  final List<String>? benefits;
  final String? jobDesc;
  final String? submitResume;
  final bool? criminalRecord;
  final String? email1;
  final String? email2;
  final String? email3;
  final int? callDirect;
  final String? hireTimeline;
  final int? progress;
  readPartJob({
    this.jobTitle,
    this.notoHire,
    this.ongoingNeed,
    this.jobLocation,
    this.streetAddress,
    this.jobType,
    this.jobSchedule,
    this.payType,
    this.min,
    this.max,
    this.minMaxRate,
    this.amount,
    this.amountRate,
    this.supplementalPay,
    this.benefits,
    this.jobDesc,
    this.submitResume,
    this.criminalRecord,
    this.email1,
    this.email2,
    this.email3,
    this.callDirect,
    this.hireTimeline,
    this.progress,
  });
  

  readPartJob copyWith({
    String? jobTitle,
    String? notoHire,
    bool? ongoingNeed,
    String? jobLocation,
    String? streetAddress,
    List<String>? jobType,
    List<String>? jobSchedule,
    String? payType,
    int? min,
    int? max,
    String? minMaxRate,
    int? amount,
    String? amountRate,
    List<String>? supplementalPay,
    List<String>? benefits,
    String? jobDesc,
    String? submitResume,
    bool? criminalRecord,
    String? email1,
    String? email2,
    String? email3,
    int? callDirect,
    String? hireTimeline,
    int? progress,
  }) {
    return readPartJob(
      jobTitle: jobTitle ?? this.jobTitle,
      notoHire: notoHire ?? this.notoHire,
      ongoingNeed: ongoingNeed ?? this.ongoingNeed,
      jobLocation: jobLocation ?? this.jobLocation,
      streetAddress: streetAddress ?? this.streetAddress,
      jobType: jobType ?? this.jobType,
      jobSchedule: jobSchedule ?? this.jobSchedule,
      payType: payType ?? this.payType,
      min: min ?? this.min,
      max: max ?? this.max,
      minMaxRate: minMaxRate ?? this.minMaxRate,
      amount: amount ?? this.amount,
      amountRate: amountRate ?? this.amountRate,
      supplementalPay: supplementalPay ?? this.supplementalPay,
      benefits: benefits ?? this.benefits,
      jobDesc: jobDesc ?? this.jobDesc,
      submitResume: submitResume ?? this.submitResume,
      criminalRecord: criminalRecord ?? this.criminalRecord,
      email1: email1 ?? this.email1,
      email2: email2 ?? this.email2,
      email3: email3 ?? this.email3,
      callDirect: callDirect ?? this.callDirect,
      hireTimeline: hireTimeline ?? this.hireTimeline,
      progress: progress ?? this.progress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jobTitle': jobTitle,
      'notoHire': notoHire,
      'ongoingNeed': ongoingNeed,
      'jobLocation': jobLocation,
      'streetAddress': streetAddress,
      'jobType': jobType,
      'jobSchedule': jobSchedule,
      'payType': payType,
      'min': min,
      'max': max,
      'minMaxRate': minMaxRate,
      'amount': amount,
      'amountRate': amountRate,
      'supplementalPay': supplementalPay,
      'benefits': benefits,
      'jobDesc': jobDesc,
      'submitResume': submitResume,
      'criminalRecord': criminalRecord,
      'email1': email1,
      'email2': email2,
      'email3': email3,
      'callDirect': callDirect,
      'hireTimeline': hireTimeline,
      'progress': progress,
    };
  }

  factory readPartJob.fromMap(Map<String, dynamic> map) {
    return readPartJob(
      jobTitle: map['jobTitle'] != null ? map['jobTitle'] as String : null,
      notoHire: map['notoHire'] != null ? map['notoHire'] as String : null,
      ongoingNeed: map['ongoingNeed'] != null ? map['ongoingNeed'] as bool : null,
      jobLocation: map['jobLocation'] != null ? map['jobLocation'] as String : null,
      streetAddress: map['streetAddress'] != null ? map['streetAddress'] as String : null,
      jobType: map['jobType'] != null ? List<String>.from((map['jobType'] as List<dynamic>)) : null,
      jobSchedule: map['jobSchedule'] != null ? List<String>.from((map['jobSchedule'] as List<dynamic>)) : null,
      payType: map['payType'] != null ? map['payType'] as String : null,
      min: map['min'] != null ? map['min'] as int : null,
      max: map['max'] != null ? map['max'] as int : null,
      minMaxRate: map['minMaxRate'] != null ? map['minMaxRate'] as String : null,
      amount: map['amount'] != null ? map['amount'] as int : null,
      amountRate: map['amountRate'] != null ? map['amountRate'] as String : null,
      supplementalPay: map['supplementalPay'] != null ? List<String>.from((map['supplementalPay'] as List<dynamic>)) : null,
      benefits: map['benefits'] != null ? List<String>.from((map['benefits'] as List<dynamic>)) : null,
      jobDesc: map['jobDesc'] != null ? map['jobDesc'] as String : null,
      submitResume: map['submitResume'] != null ? map['submitResume'] as String : null,
      criminalRecord: map['criminalRecord'] != null ? map['criminalRecord'] as bool : null,
      email1: map['email1'] != null ? map['email1'] as String : null,
      email2: map['email2'] != null ? map['email2'] as String : null,
      email3: map['email3'] != null ? map['email3'] as String : null,
      callDirect: map['callDirect'] != null ? map['callDirect'] as int : null,
      hireTimeline: map['hireTimeline'] != null ? map['hireTimeline'] as String : null,
      progress: map['progress'] != null ? map['progress'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory readPartJob.fromJson(String source) => readPartJob.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'readFullJob(jobTitle: $jobTitle, notoHire: $notoHire, ongoingNeed: $ongoingNeed, jobLocation: $jobLocation, streetAddress: $streetAddress, jobType: $jobType, jobSchedule: $jobSchedule, payType: $payType, min: $min, max: $max, minMaxRate: $minMaxRate, amount: $amount, amountRate: $amountRate, supplementalPay: $supplementalPay, benefits: $benefits, jobDesc: $jobDesc, submitResume: $submitResume, criminalRecord: $criminalRecord, email1: $email1, email2: $email2, email3: $email3, callDirect: $callDirect, hireTimeline: $hireTimeline, progress: $progress)';
  }

  @override
  bool operator ==(covariant readPartJob other) {
    if (identical(this, other)) return true;
  
    return 
      other.jobTitle == jobTitle &&
      other.notoHire == notoHire &&
      other.ongoingNeed == ongoingNeed &&
      other.jobLocation == jobLocation &&
      other.streetAddress == streetAddress &&
      listEquals(other.jobType, jobType) &&
      listEquals(other.jobSchedule, jobSchedule) &&
      other.payType == payType &&
      other.min == min &&
      other.max == max &&
      other.minMaxRate == minMaxRate &&
      other.amount == amount &&
      other.amountRate == amountRate &&
      listEquals(other.supplementalPay, supplementalPay) &&
      listEquals(other.benefits, benefits) &&
      other.jobDesc == jobDesc &&
      other.submitResume == submitResume &&
      other.criminalRecord == criminalRecord &&
      other.email1 == email1 &&
      other.email2 == email2 &&
      other.email3 == email3 &&
      other.callDirect == callDirect &&
      other.hireTimeline == hireTimeline &&
      other.progress == progress;
  }

  @override
  int get hashCode {
    return jobTitle.hashCode ^
      notoHire.hashCode ^
      ongoingNeed.hashCode ^
      jobLocation.hashCode ^
      streetAddress.hashCode ^
      jobType.hashCode ^
      jobSchedule.hashCode ^
      payType.hashCode ^
      min.hashCode ^
      max.hashCode ^
      minMaxRate.hashCode ^
      amount.hashCode ^
      amountRate.hashCode ^
      supplementalPay.hashCode ^
      benefits.hashCode ^
      jobDesc.hashCode ^
      submitResume.hashCode ^
      criminalRecord.hashCode ^
      email1.hashCode ^
      email2.hashCode ^
      email3.hashCode ^
      callDirect.hashCode ^
      hireTimeline.hashCode ^
      progress.hashCode;
  }
}
