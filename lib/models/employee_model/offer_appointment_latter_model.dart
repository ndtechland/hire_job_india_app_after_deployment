// To parse this JSON data, do
//
//     final getOfferAppointmentModel = getOfferAppointmentModelFromJson(jsonString);

import 'dart:convert';

GetOfferAppointmentModel getOfferAppointmentModelFromJson(String str) =>
    GetOfferAppointmentModel.fromJson(json.decode(str));

String getOfferAppointmentModelToJson(GetOfferAppointmentModel data) =>
    json.encode(data.toJson());

class GetOfferAppointmentModel {
  bool? succeeded;
  int? statusCode;
  String? status;
  String? message;
  dynamic error;
  Data? data;

  GetOfferAppointmentModel({
    this.succeeded,
    this.statusCode,
    this.status,
    this.message,
    this.error,
    this.data,
  });

  factory GetOfferAppointmentModel.fromJson(Map<String, dynamic> json) =>
      GetOfferAppointmentModel(
        succeeded: json["succeeded"],
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "succeeded": succeeded,
        "statusCode": statusCode,
        "status": status,
        "message": message,
        "error": error,
        "data": data?.toJson(),
      };
}

class Data {
  String? offerletter;
  String? appointmentletter;

  Data({
    this.offerletter,
    this.appointmentletter,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        offerletter: json["offerletter"],
        appointmentletter: json["appointmentletter"],
      );

  Map<String, dynamic> toJson() => {
        "offerletter": offerletter,
        "appointmentletter": appointmentletter,
      };
}
