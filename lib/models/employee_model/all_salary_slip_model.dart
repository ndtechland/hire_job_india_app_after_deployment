// To parse this JSON data, do
//
//     final allsalaryslipModells = allsalaryslipModellsFromJson(jsonString);

import 'dart:convert';

AllsalaryslipModells allsalaryslipModellsFromJson(String str) =>
    AllsalaryslipModells.fromJson(json.decode(str));

String allsalaryslipModellsToJson(AllsalaryslipModells data) =>
    json.encode(data.toJson());

class AllsalaryslipModells {
  bool? succeeded;
  num? statusCode;
  String? status;
  String? message;
  dynamic error;
  List<ModelClassSalary>? data;

  AllsalaryslipModells({
    this.succeeded,
    this.statusCode,
    this.status,
    this.message,
    this.error,
    this.data,
  });

  factory AllsalaryslipModells.fromJson(Map<String, dynamic> json) =>
      AllsalaryslipModells(
        succeeded: json["succeeded"],
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: json["data"] == null
            ? []
            : List<ModelClassSalary>.from(
                json["data"]!.map((x) => ModelClassSalary.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "succeeded": succeeded,
        "statusCode": statusCode,
        "status": status,
        "message": message,
        "error": error,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ModelClassSalary {
  num? id;
  num? month;
  num? year;
  String? salarySlipPath;
  String? salarySlipName;

  ModelClassSalary({
    this.id,
    this.month,
    this.year,
    this.salarySlipPath,
    this.salarySlipName,
  });

  factory ModelClassSalary.fromJson(Map<String, dynamic> json) =>
      ModelClassSalary(
        id: json["id"],
        month: json["month"],
        year: json["year"],
        salarySlipPath: json["salarySlipPath"],
        salarySlipName: json["salarySlipName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "month": month,
        "year": year,
        "salarySlipPath": salarySlipPath,
        "salarySlipName": salarySlipName,
      };
}
