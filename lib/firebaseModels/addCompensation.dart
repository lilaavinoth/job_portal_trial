// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:job_portal_trial/backend/backend.dart';

class compensationModel {
  final String? payType;
  final int? min;
  final int? max;
  final String? minMaxRate;
  final int? amount;
  final String? amountRate;
  final List<String>? supplementalPay;
  final List<String>? benefits;
  final Timestamp timestamp;
  final int progress;
  compensationModel({
    required this.payType,
    required this.min,
    required this.max,
    required this.minMaxRate,
    required this.amount,
    required this.amountRate,
    required this.supplementalPay,
    required this.benefits,
    required this.timestamp,
    required this.progress,
  });
  

  compensationModel copyWith({
    String? payType,
    int? min,
    int? max,
    String? minMaxRate,
    int? amount,
    String? amountRate,
    List<String>? supplementalPay,
    List<String>? benefits,
    Timestamp? timestamp,
    int? progress,
  }) {
    return compensationModel(
      payType: payType ?? this.payType,
      min: min ?? this.min,
      max: max ?? this.max,
      minMaxRate: minMaxRate ?? this.minMaxRate,
      amount: amount ?? this.amount,
      amountRate: amountRate ?? this.amountRate,
      supplementalPay: supplementalPay ?? this.supplementalPay,
      benefits: benefits ?? this.benefits,
      timestamp: timestamp ?? this.timestamp,
      progress: progress ?? this.progress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'payType': payType,
      'min': min,
      'max': max,
      'minMaxRate': minMaxRate,
      'amount': amount,
      'amountRate': amountRate,
      'supplementalPay': supplementalPay,
      'benefits': benefits,
      'timestamp': timestamp,
      'progress': progress,
    };
  }

  

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'compensationModel(payType: $payType, min: $min, max: $max, minMaxRate: $minMaxRate, amount: $amount, amountRate: $amountRate, supplementalPay: $supplementalPay, benefits: $benefits, timestamp: $timestamp, progress: $progress)';
  }

  @override
  bool operator ==(covariant compensationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.payType == payType &&
      other.min == min &&
      other.max == max &&
      other.minMaxRate == minMaxRate &&
      other.amount == amount &&
      other.amountRate == amountRate &&
      listEquals(other.supplementalPay, supplementalPay) &&
      listEquals(other.benefits, benefits) &&
      other.timestamp == timestamp &&
      other.progress == progress;
  }

  @override
  int get hashCode {
    return payType.hashCode ^
      min.hashCode ^
      max.hashCode ^
      minMaxRate.hashCode ^
      amount.hashCode ^
      amountRate.hashCode ^
      supplementalPay.hashCode ^
      benefits.hashCode ^
      timestamp.hashCode ^
      progress.hashCode;
  }
}
