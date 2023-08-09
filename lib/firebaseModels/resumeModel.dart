// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class resumeModel {
  final List<String> resumeList;
  resumeModel({
    required this.resumeList,
  });
  

  resumeModel copyWith({
    List<String>? resumeList,
  }) {
    return resumeModel(
      resumeList: resumeList ?? this.resumeList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'resumeList': resumeList,
    };
  }

  factory resumeModel.fromMap(Map<String, dynamic> map) {
    return resumeModel(
      resumeList: List<String>.from((map['resumeList'] as List<String>),
    ));
  }

  String toJson() => json.encode(toMap());

  factory resumeModel.fromJson(String source) => resumeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'resumeModel(resumeList: $resumeList)';

  @override
  bool operator ==(covariant resumeModel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.resumeList, resumeList);
  }

  @override
  int get hashCode => resumeList.hashCode;
}
