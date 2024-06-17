// To parse this JSON data, do
//
//     final supportModel = supportModelFromJson(jsonString);

import 'dart:convert';

SupportModel supportModelFromJson(String str) =>
    SupportModel.fromJson(json.decode(str));

String supportModelToJson(SupportModel data) => json.encode(data.toJson());

class SupportModel {
  Response? response;
  int? status;
  String? message;

  SupportModel({
    this.response,
    this.status,
    this.message,
  });

  factory SupportModel.fromJson(Map<String, dynamic> json) => SupportModel(
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "response": response?.toJson(),
        "status": status,
        "message": message,
      };
}

class Response {
  int? id;
  String? location;
  String? openDays;
  String? open;
  String? closes;
  String? email;
  String? callNumber;

  Response({
    this.id,
    this.location,
    this.openDays,
    this.open,
    this.closes,
    this.email,
    this.callNumber,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        location: json["location"],
        openDays: json["openDays"],
        open: json["open"],
        closes: json["closes"],
        email: json["email"],
        callNumber: json["callNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "location": location,
        "openDays": openDays,
        "open": open,
        "closes": closes,
        "email": email,
        "callNumber": callNumber,
      };
}
