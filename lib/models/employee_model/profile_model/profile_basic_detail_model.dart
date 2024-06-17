// To parse this JSON data, do
//
//     final basicInformationModel = basicInformationModelFromJson(jsonString);

import 'dart:convert';

BasicInformationModel basicInformationModelFromJson(String str) =>
    BasicInformationModel.fromJson(json.decode(str));

String basicInformationModelToJson(BasicInformationModel data) =>
    json.encode(data.toJson());

class BasicInformationModel {
  bool? succeeded;
  int? statusCode;
  String? status;
  String? message;
  dynamic error;
  Data? data;

  BasicInformationModel({
    this.succeeded,
    this.statusCode,
    this.status,
    this.message,
    this.error,
    this.data,
  });

  factory BasicInformationModel.fromJson(Map<String, dynamic> json) =>
      BasicInformationModel(
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
  String? employeeId;
  String? fullName;
  String? firstName;
  String? middleName;
  String? lastName;
  String? workEmail;
  String? dateOfJoining;
  String? gender;
  String? companyname;
  String? ofcStatename;
  String? ofccityname;
  String? departmentname;
  String? jobTitle;

  Data({
    this.employeeId,
    this.fullName,
    this.firstName,
    this.middleName,
    this.lastName,
    this.workEmail,
    this.dateOfJoining,
    this.gender,
    this.companyname,
    this.ofcStatename,
    this.ofccityname,
    this.departmentname,
    this.jobTitle,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        employeeId: json["employeeId"],
        fullName: json["fullName"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        workEmail: json["workEmail"],
        dateOfJoining: json["dateOfJoining"],
        gender: json["gender"],
        companyname: json["companyname"],
        ofcStatename: json["ofcStatename"],
        ofccityname: json["ofccityname"],
        departmentname: json["departmentname"],
        jobTitle: json["job_Title"],
      );

  Map<String, dynamic> toJson() => {
        "employeeId": employeeId,
        "fullName": fullName,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "workEmail": workEmail,
        "dateOfJoining": dateOfJoining,
        "gender": gender,
        "companyname": companyname,
        "ofcStatename": ofcStatename,
        "ofccityname": ofccityname,
        "departmentname": departmentname,
        "job_Title": jobTitle,
      };
}
