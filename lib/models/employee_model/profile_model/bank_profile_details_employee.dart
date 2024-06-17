// To parse this JSON data, do
//
//     final bankDetailInformationModel = bankDetailInformationModelFromJson(jsonString);

import 'dart:convert';

BankDetailInformationModel bankDetailInformationModelFromJson(String str) =>
    BankDetailInformationModel.fromJson(json.decode(str));

String bankDetailInformationModelToJson(BankDetailInformationModel data) =>
    json.encode(data.toJson());

class BankDetailInformationModel {
  bool? succeeded;
  int? statusCode;
  String? status;
  String? message;
  dynamic error;
  Data? data;

  BankDetailInformationModel({
    this.succeeded,
    this.statusCode,
    this.status,
    this.message,
    this.error,
    this.data,
  });

  factory BankDetailInformationModel.fromJson(Map<String, dynamic> json) =>
      BankDetailInformationModel(
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
  String? accountHolderName;
  String? bankName;
  String? accountNumber;
  String? reEnterAccountNumber;
  String? ifsc;
  String? accountTypeId;
  String? epfNumber;
  String? nominee;
  String? chequeimage;
  dynamic chequebase64;

  Data({
    this.accountHolderName,
    this.bankName,
    this.accountNumber,
    this.reEnterAccountNumber,
    this.ifsc,
    this.accountTypeId,
    this.epfNumber,
    this.nominee,
    this.chequeimage,
    this.chequebase64,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accountHolderName: json["accountHolderName"],
        bankName: json["bankName"],
        accountNumber: json["accountNumber"],
        reEnterAccountNumber: json["reEnterAccountNumber"],
        ifsc: json["ifsc"],
        accountTypeId: json["accountTypeId"],
        epfNumber: json["epfNumber"],
        nominee: json["nominee"],
        chequeimage: json["chequeimage"],
        chequebase64: json["chequebase64"],
      );

  Map<String, dynamic> toJson() => {
        "accountHolderName": accountHolderName,
        "bankName": bankName,
        "accountNumber": accountNumber,
        "reEnterAccountNumber": reEnterAccountNumber,
        "ifsc": ifsc,
        "accountTypeId": accountTypeId,
        "epfNumber": epfNumber,
        "nominee": nominee,
        "chequeimage": chequeimage,
        "chequebase64": chequebase64,
      };
}
