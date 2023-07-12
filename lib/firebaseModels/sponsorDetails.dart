// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class sponsorModel {
  final String? sponsorType;
  final int? applicationLimit;
  final int? progress;
  sponsorModel({
    required this.sponsorType,
    required this.applicationLimit,
    this.progress,
  });

  sponsorModel copyWith({
    String? sponsorType,
    int? applicationLimit,
    int? progress,
  }) {
    return sponsorModel(
      sponsorType: sponsorType ?? this.sponsorType,
      applicationLimit: applicationLimit ?? this.applicationLimit,
      progress: progress ?? this.progress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sponsorType': sponsorType,
      'applicationLimit': applicationLimit,
      'progress': progress,
    };
  }

  factory sponsorModel.fromMap(Map<String, dynamic> map) {
    return sponsorModel(
      sponsorType: map['sponsorType'] != null ? map['sponsorType'] as String : null,
      applicationLimit: map['applicationLimit'] != null ? map['applicationLimit'] as int : null,
      progress: map['progress'] != null ? map['progress'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory sponsorModel.fromJson(String source) => sponsorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'sponsorModel(sponsorType: $sponsorType, applicationLimit: $applicationLimit, progress: $progress)';

  @override
  bool operator ==(covariant sponsorModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.sponsorType == sponsorType &&
      other.applicationLimit == applicationLimit &&
      other.progress == progress;
  }

  @override
  int get hashCode => sponsorType.hashCode ^ applicationLimit.hashCode ^ progress.hashCode;
}
