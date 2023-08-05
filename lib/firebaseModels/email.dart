// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class emailModel {
  final List<String> to;
  final Map message;
  emailModel({
    required this.to,
    required this.message,
  });

  emailModel copyWith({
    List<String>? to,
    Map? message,
  }) {
    return emailModel(
      to: to ?? this.to,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'to': to,
      'message': message,
    };
  }

  factory emailModel.fromMap(Map<String, dynamic> map) {
    return emailModel(
      to: List<String>.from((map['to'] as List<String>)),
      message: Map.from((map['message'] as Map),
    ));
  }

  String toJson() => json.encode(toMap());

  factory emailModel.fromJson(String source) => emailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'emailModel(to: $to, message: $message)';

  @override
  bool operator ==(covariant emailModel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.to, to) &&
      mapEquals(other.message, message);
  }

  @override
  int get hashCode => to.hashCode ^ message.hashCode;
}


class MessageContent {
  final String subject;
  final String text;
  final String html;
  MessageContent({
    required this.subject,
    required this.text,
    required this.html,
  });

  MessageContent copyWith({
    String? subject,
    String? text,
    String? html,
  }) {
    return MessageContent(
      subject: subject ?? this.subject,
      text: text ?? this.text,
      html: html ?? this.html,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subject': subject,
      'text': text,
      'html': html,
    };
  }

  factory MessageContent.fromMap(Map<String, dynamic> map) {
    return MessageContent(
      subject: map['subject'] as String,
      text: map['text'] as String,
      html: map['html'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageContent.fromJson(String source) => MessageContent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MessageContent(subject: $subject, text: $text, html: $html)';

  @override
  bool operator ==(covariant MessageContent other) {
    if (identical(this, other)) return true;
  
    return 
      other.subject == subject &&
      other.text == text &&
      other.html == html;
  }

  @override
  int get hashCode => subject.hashCode ^ text.hashCode ^ html.hashCode;
}
