// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class resumeSelectionList {
  final List<String>? resumeList;
  resumeSelectionList({
    this.resumeList,
  });

  resumeSelectionList copyWith({
    List<String>? resumeList,
  }) {
    return resumeSelectionList(
      resumeList: resumeList ?? this.resumeList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'resumeList': resumeList,
    };
  }

  factory resumeSelectionList.fromMap(Map<String, dynamic> map) {
    return resumeSelectionList(
      resumeList: List<String>.from((map['resumeList'] as List<dynamic>),
    ));
  }

  String toJson() => json.encode(toMap());

  factory resumeSelectionList.fromJson(String source) => resumeSelectionList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'resumeSelectionList(resumeList: $resumeList)';

  @override
  bool operator ==(covariant resumeSelectionList other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.resumeList, resumeList);
  }

  @override
  int get hashCode => resumeList.hashCode;
}
