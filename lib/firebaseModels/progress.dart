// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class progressModel {
  final int? progress;
  final String? companyName;
  progressModel({
    this.progress,
    this.companyName,
  });

  progressModel copyWith({
    int? progress,
    String? companyName,
  }) {
    return progressModel(
      progress: progress ?? this.progress,
      companyName: companyName ?? this.companyName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'progress': progress,
      'companyName': companyName,
    };
  }

  factory progressModel.fromMap(Map<String, dynamic> map) {
    return progressModel(
      progress: map['progress'] != null ? map['progress'] as int : null,
      companyName: map['companyName'] != null ? map['companyName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory progressModel.fromJson(String source) => progressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'progressModel(progress: $progress, companyName: $companyName)';

  @override
  bool operator ==(covariant progressModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.progress == progress &&
      other.companyName == companyName;
  }

  @override
  int get hashCode => progress.hashCode ^ companyName.hashCode;
}
