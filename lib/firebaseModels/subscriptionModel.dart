// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class subscriptionModel {
  final String? price;
  final String? url;
  final String? client;
  final String? success_url;
  final String? model;
  final String? mode;
  final String? sessionId;
  subscriptionModel({
    this.price,
    this.url,
    this.client,
    this.success_url,
    this.model,
    this.mode,
    this.sessionId,
  });


  subscriptionModel copyWith({
    String? price,
    String? url,
    String? client,
    String? success_url,
    String? model,
    String? mode,
    String? sessionId,
  }) {
    return subscriptionModel(
      price: price ?? this.price,
      url: url ?? this.url,
      client: client ?? this.client,
      success_url: success_url ?? this.success_url,
      model: model ?? this.model,
      mode: mode ?? this.mode,
      sessionId: sessionId ?? this.sessionId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'price': price,
      'url': url,
      'client': client,
      'success_url': success_url,
      'model': model,
      'mode': mode,
      'sessionId': sessionId,
    };
  }

  factory subscriptionModel.fromMap(Map<String, dynamic> map) {
    return subscriptionModel(
      price: map['price'] != null ? map['price'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      client: map['client'] != null ? map['client'] as String : null,
      success_url: map['success_url'] != null ? map['success_url'] as String : null,
      model: map['model'] != null ? map['model'] as String : null,
      mode: map['mode'] != null ? map['mode'] as String : null,
      sessionId: map['sessionId'] != null ? map['sessionId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory subscriptionModel.fromJson(String source) => subscriptionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'subscriptionModel(price: $price, url: $url, client: $client, success_url: $success_url, model: $model, mode: $mode, sessionId: $sessionId)';
  }

  @override
  bool operator ==(covariant subscriptionModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.price == price &&
      other.url == url &&
      other.client == client &&
      other.success_url == success_url &&
      other.model == model &&
      other.mode == mode &&
      other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    return price.hashCode ^
      url.hashCode ^
      client.hashCode ^
      success_url.hashCode ^
      model.hashCode ^
      mode.hashCode ^
      sessionId.hashCode;
  }
}
