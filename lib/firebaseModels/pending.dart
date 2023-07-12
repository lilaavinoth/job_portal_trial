// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class pendingModel {
  final int? progress;
  final String? jobTitle;
  pendingModel({
    this.progress,
    this.jobTitle,
  });

      


  pendingModel copyWith({
    int? progress,
    String? jobTitle,
  }) {
    return pendingModel(
      progress: progress ?? this.progress,
      jobTitle: jobTitle ?? this.jobTitle,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'progress': progress,
      'jobTitle': jobTitle,
    };
  }

  factory pendingModel.fromMap(Map<String, dynamic> map) {
    return pendingModel(
      progress: map['progress'] != null ? map['progress'] as int : null,
      jobTitle: map['jobTitle'] != null ? map['jobTitle'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory pendingModel.fromJson(String source) => pendingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'progressModel(progress: $progress, jobTitle: $jobTitle)';

  @override
  bool operator ==(covariant pendingModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.progress == progress &&
      other.jobTitle == jobTitle;
  }

  @override
  int get hashCode => progress.hashCode ^ jobTitle.hashCode;
}
