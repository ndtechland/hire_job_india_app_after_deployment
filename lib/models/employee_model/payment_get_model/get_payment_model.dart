// To parse this JSON data, do
//
//     final getPaymentModel = getPaymentModelFromJson(jsonString);

import 'dart:convert';

GetPaymentModel getPaymentModelFromJson(String str) =>
    GetPaymentModel.fromJson(json.decode(str));

String getPaymentModelToJson(GetPaymentModel data) =>
    json.encode(data.toJson());

class GetPaymentModel {
  bool? succeeded;
  num? statusCode;
  String? status;
  String? message;
  dynamic error;
  num? data;

  GetPaymentModel({
    this.succeeded,
    this.statusCode,
    this.status,
    this.message,
    this.error,
    this.data,
  });

  factory GetPaymentModel.fromJson(Map<String, dynamic> json) =>
      GetPaymentModel(
        succeeded: json["succeeded"],
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "succeeded": succeeded,
        "statusCode": statusCode,
        "status": status,
        "message": message,
        "error": error,
        "data": data,
      };
}
