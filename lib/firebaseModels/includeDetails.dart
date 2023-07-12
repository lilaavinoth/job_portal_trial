// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:job_portal_trial/backend/backend.dart';

class includeDetailsModel {
  final List<String>? jobType;
  final List<String>? jobSchedule;
  final int progress;
  final Timestamp timestamp;
  includeDetailsModel({
    required this.jobType,
    required this.jobSchedule,
    required this.progress,
    required this.timestamp,
  });

  includeDetailsModel copyWith({
    List<String>? jobType,
    List<String>? jobSchedule,
    int? progress,
    Timestamp? timestamp,
  }) {
    return includeDetailsModel(
      jobType: jobType ?? this.jobType,
      jobSchedule: jobSchedule ?? this.jobSchedule,
      progress: progress ?? this.progress,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jobType': jobType,
      'jobSchedule': jobSchedule,
      'progress': progress,
      'timestamp': timestamp,
    };
  }

  

  String toJson() => json.encode(toMap());

  
  @override
  String toString() {
    return 'includeDetailsModel(jobType: $jobType, jobSchedule: $jobSchedule, progress: $progress, timestamp: $timestamp)';
  }

  @override
  bool operator ==(covariant includeDetailsModel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.jobType, jobType) &&
      listEquals(other.jobSchedule, jobSchedule) &&
      other.progress == progress &&
      other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return jobType.hashCode ^
      jobSchedule.hashCode ^
      progress.hashCode ^
      timestamp.hashCode;
  }
}
