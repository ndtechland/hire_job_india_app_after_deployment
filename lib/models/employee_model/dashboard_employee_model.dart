// To parse this JSON data, do
//
//     final dashbordModel = dashbordModelFromJson(jsonString);

import 'dart:convert';

DashbordModel dashbordModelFromJson(String str) =>
    DashbordModel.fromJson(json.decode(str));

String dashbordModelToJson(DashbordModel data) => json.encode(data.toJson());

class DashbordModel {
  bool? succeeded;
  int? statusCode;
  String? status;
  String? message;
  dynamic error;
  Data? data;

  DashbordModel({
    this.succeeded,
    this.statusCode,
    this.status,
    this.message,
    this.error,
    this.data,
  });

  factory DashbordModel.fromJson(Map<String, dynamic> json) => DashbordModel(
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
  num? totalAttendance;
  String? attendance;
  double? leaveLeft;
  num? leave;
  String? offerletter;
  String? appointmentletter;
  String? completionPercentage;

  Data({
    this.totalAttendance,
    this.attendance,
    this.leaveLeft,
    this.leave,
    this.offerletter,
    this.appointmentletter,
    this.completionPercentage,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalAttendance: json["totalAttendance"],
        attendance: json["attendance"],
        leaveLeft: json["leaveLeft"]?.toDouble(),
        leave: json["leave"],
        offerletter: json["offerletter"],
        appointmentletter: json["appointmentletter"],
        completionPercentage: json["completionPercentage"],
      );

  Map<String, dynamic> toJson() => {
        "totalAttendance": totalAttendance,
        "attendance": attendance,
        "leaveLeft": leaveLeft,
        "leave": leave,
        "offerletter": offerletter,
        "appointmentletter": appointmentletter,
        "completionPercentage": completionPercentage,
      };
}
