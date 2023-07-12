// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:job_portal_trial/backend/backend.dart';

class jobDescModel {
  final String jobDesc;
  final int progress;
  final Timestamp timestamp;
  jobDescModel({
    required this.jobDesc,
    required this.progress,
    required this.timestamp,
  });

  jobDescModel copyWith({
    String? jobDesc,
    int? progress,
    Timestamp? timestamp,
  }) {
    return jobDescModel(
      jobDesc: jobDesc ?? this.jobDesc,
      progress: progress ?? this.progress,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jobDesc': jobDesc,
      'progress': progress,
      'timestamp': timestamp,
    };
  }

  

  String toJson() => json.encode(toMap());


  @override
  String toString() => 'jobDescModel(jobDesc: $jobDesc, progress: $progress, timestamp: $timestamp)';

  @override
  bool operator ==(covariant jobDescModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.jobDesc == jobDesc &&
      other.progress == progress &&
      other.timestamp == timestamp;
  }

  @override
  int get hashCode => jobDesc.hashCode ^ progress.hashCode ^ timestamp.hashCode;
}
