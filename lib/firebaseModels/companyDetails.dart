// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:job_portal_trial/backend/backend.dart';

class newCompanyModel {
  final String? companyName;
  final String? noEmployees;
  final String? name;
  final String? phoneNo;
  final Timestamp? created_date;
  newCompanyModel({
    this.companyName,
    this.noEmployees,
    this.name,
    this.phoneNo,
    this.created_date,
  });
  

  newCompanyModel copyWith({
    String? companyName,
    String? noEmployees,
    String? name,
    String? phoneNo,
    Timestamp? created_date,
  }) {
    return newCompanyModel(
      companyName: companyName ?? this.companyName,
      noEmployees: noEmployees ?? this.noEmployees,
      name: name ?? this.name,
      phoneNo: phoneNo ?? this.phoneNo,
      created_date: created_date ?? this.created_date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'companyName': companyName,
      'noEmployees': noEmployees,
      'name': name,
      'phoneNo': phoneNo,
      'created_date': created_date,
    };
  }

  factory newCompanyModel.fromMap(Map<String, dynamic> map) {
    return newCompanyModel(
      companyName: map['companyName'] != null ? map['companyName'] as String : null,
      noEmployees: map['noEmployees'] != null ? map['noEmployees'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      phoneNo: map['phoneNo'] != null ? map['phoneNo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory newCompanyModel.fromJson(String source) => newCompanyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'newCompanyModel(companyName: $companyName, noEmployees: $noEmployees, name: $name, phoneNo: $phoneNo, created_date: $created_date)';
  }

  @override
  bool operator ==(covariant newCompanyModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.companyName == companyName &&
      other.noEmployees == noEmployees &&
      other.name == name &&
      other.phoneNo == phoneNo &&
      other.created_date == created_date;
  }

  @override
  int get hashCode {
    return companyName.hashCode ^
      noEmployees.hashCode ^
      name.hashCode ^
      phoneNo.hashCode ^
      created_date.hashCode;
  }
}
