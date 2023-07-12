// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../backend/backend.dart';

class basicInfoModel {
  final String? jobTitle;
  final String? notoHire;
  final bool? ongoingNeed;
  final String? jobLocation;
  final String streetAddress;
  final int progress;
  final Timestamp created_date;

  basicInfoModel({
    required this.jobTitle,
    required this.notoHire,
    required this.ongoingNeed,
    required this.jobLocation,
    required this.streetAddress,
    required this.progress,
    required this.created_date,
  });
  

  basicInfoModel copyWith({
    String? jobTitle,
    String? notoHire,
    bool? ongoingNeed,
    String? jobLocation,
    String? streetAddress,
    int? progress,
    Timestamp? created_date,
  }) {
    return basicInfoModel(
      jobTitle: jobTitle ?? this.jobTitle,
      notoHire: notoHire ?? this.notoHire,
      ongoingNeed: ongoingNeed ?? this.ongoingNeed,
      jobLocation: jobLocation ?? this.jobLocation,
      streetAddress: streetAddress ?? this.streetAddress,
      progress: progress ?? this.progress,
      created_date: created_date ?? this.created_date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jobTitle': jobTitle,
      'notoHire': notoHire,
      'ongoingNeed': ongoingNeed,
      'jobLocation': jobLocation,
      'streetAddress': streetAddress,
      'progress': progress,
      'created_date': created_date,
    };
  }

  String toJson() => json.encode(toMap());

  
  @override
  String toString() {
    return 'basicInfo(jobTitle: $jobTitle, notoHire: $notoHire, ongoingNeed: $ongoingNeed, jobLocation: $jobLocation, streetAddress: $streetAddress, progress: $progress, created_date: $created_date)';
  }

  @override
  bool operator ==(covariant basicInfoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.jobTitle == jobTitle &&
      other.notoHire == notoHire &&
      other.ongoingNeed == ongoingNeed &&
      other.jobLocation == jobLocation &&
      other.streetAddress == streetAddress &&
      other.progress == progress &&
      other.created_date == created_date;
  }

  @override
  int get hashCode {
    return jobTitle.hashCode ^
      notoHire.hashCode ^
      ongoingNeed.hashCode ^
      jobLocation.hashCode ^
      streetAddress.hashCode ^
      progress.hashCode ^
      created_date.hashCode;
  }
}
