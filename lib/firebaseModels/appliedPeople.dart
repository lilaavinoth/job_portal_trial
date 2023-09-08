// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../backend/backend.dart';

class AppliedPeople {
  final String applierEmail;
  final String applierName;
  final String applierCVLink;
  final String applierUid;
  final Timestamp timestamp;
  AppliedPeople({
    required this.applierEmail,
    required this.applierName,
    required this.applierCVLink,
    required this.applierUid,
    required this.timestamp,
  });

  AppliedPeople copyWith({
    String? applierEmail,
    String? applierName,
    String? applierCVLink,
    String? applierUid,
    Timestamp? timestamp,
  }) {
    return AppliedPeople(
      applierEmail: applierEmail ?? this.applierEmail,
      applierName: applierName ?? this.applierName,
      applierCVLink: applierCVLink ?? this.applierCVLink,
      applierUid: applierUid ?? this.applierUid,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'applierEmail': applierEmail,
      'applierName': applierName,
      'applierCVLink': applierCVLink,
      'applierUid': applierUid,
      'timestamp': timestamp,
    };
  }

  factory AppliedPeople.fromMap(Map<String, dynamic> map) {
    return AppliedPeople(
      applierEmail: map['applierEmail'] as String,
      applierName: map['applierName'] as String,
      applierCVLink: map['applierCVLink'] as String,
      applierUid: map['applierUid'] as String,
      timestamp: map['timestamp'] as Timestamp,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppliedPeople.fromJson(String source) => AppliedPeople.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppliedPeople(applierEmail: $applierEmail, applierName: $applierName, applierCVLink: $applierCVLink, applierUid: $applierUid, timestamp: $timestamp)';
  }

  @override
  bool operator ==(covariant AppliedPeople other) {
    if (identical(this, other)) return true;
  
    return 
      other.applierEmail == applierEmail &&
      other.applierName == applierName &&
      other.applierCVLink == applierCVLink &&
      other.applierUid == applierUid &&
      other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return applierEmail.hashCode ^
      applierName.hashCode ^
      applierCVLink.hashCode ^
      applierUid.hashCode ^
      timestamp.hashCode;
  }
}
