// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class progressModel {
  final int? progress;
  progressModel({
    this.progress,
  });

  progressModel copyWith({
    int? progress,
  }) {
    return progressModel(
      progress: progress ?? this.progress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'progress': progress,
    };
  }

  factory progressModel.fromMap(Map<String, dynamic> map) {
    return progressModel(
      progress: map['progress'] != null ? map['progress'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory progressModel.fromJson(String source) => progressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'progressModel(progress: $progress)';

  @override
  bool operator ==(covariant progressModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.progress == progress;
  }

  @override
  int get hashCode => progress.hashCode;
}
