// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:job_portal_trial/backend/backend.dart';

class applicationPreferenceModel {
  final int progress;
  final String? submitResume;
  final bool? criminalRecord;
  final String? email1;
  final String? email2;
  final String? email3;
  final int? callDirect;
  final String? hireTimeline;
  final Timestamp timestamp;
  applicationPreferenceModel({
    required this.progress,
    required this.submitResume,
    required this.criminalRecord,
    required this.email1,
    required this.email2,
    required this.email3,
    required this.callDirect,
    required this.hireTimeline,
    required this.timestamp,
  });
  

  applicationPreferenceModel copyWith({
    int? progress,
    String? submitResume,
    bool? criminalRecord,
    String? email1,
    String? email2,
    String? email3,
    int? callDirect,
    String? hireTimeline,
    Timestamp? timestamp,
  }) {
    return applicationPreferenceModel(
      progress: progress ?? this.progress,
      submitResume: submitResume ?? this.submitResume,
      criminalRecord: criminalRecord ?? this.criminalRecord,
      email1: email1 ?? this.email1,
      email2: email2 ?? this.email2,
      email3: email3 ?? this.email3,
      callDirect: callDirect ?? this.callDirect,
      hireTimeline: hireTimeline ?? this.hireTimeline,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'progress': progress,
      'submitResume': submitResume,
      'criminalRecord': criminalRecord,
      'email1': email1,
      'email2': email2,
      'email3': email3,
      'callDirect': callDirect,
      'hireTimeline': hireTimeline,
      'timestamp': timestamp,
    };
  }

  

  String toJson() => json.encode(toMap());


  @override
  String toString() {
    return 'applicationPreferenceModel(progress: $progress, submitResume: $submitResume, criminalRecord: $criminalRecord, email1: $email1, email2: $email2, email3: $email3, callDirect: $callDirect, hireTimeline: $hireTimeline, timestamp: $timestamp)';
  }

  @override
  bool operator ==(covariant applicationPreferenceModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.progress == progress &&
      other.submitResume == submitResume &&
      other.criminalRecord == criminalRecord &&
      other.email1 == email1 &&
      other.email2 == email2 &&
      other.email3 == email3 &&
      other.callDirect == callDirect &&
      other.hireTimeline == hireTimeline &&
      other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return progress.hashCode ^
      submitResume.hashCode ^
      criminalRecord.hashCode ^
      email1.hashCode ^
      email2.hashCode ^
      email3.hashCode ^
      callDirect.hashCode ^
      hireTimeline.hashCode ^
      timestamp.hashCode;
  }
}
