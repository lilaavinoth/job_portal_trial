// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class AddAppliedJobId {
  List<String> appliedList;
  AddAppliedJobId({
    required this.appliedList,
  });

  AddAppliedJobId copyWith({
    List<String>? appliedList,
  }) {
    return AddAppliedJobId(
      appliedList: appliedList ?? this.appliedList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'appliedList': appliedList,
    };
  }

  factory AddAppliedJobId.fromMap(Map<String, dynamic> map) {
    return AddAppliedJobId(
      appliedList: List<String>.from((map['appliedList'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddAppliedJobId.fromJson(String source) => AddAppliedJobId.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AddAppliedJobId(appliedList: $appliedList)';

  @override
  bool operator ==(covariant AddAppliedJobId other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.appliedList, appliedList);
  }

  @override
  int get hashCode => appliedList.hashCode;
}
