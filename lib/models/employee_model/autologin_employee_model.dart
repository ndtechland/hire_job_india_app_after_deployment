// To parse this JSON data, do
//
//     final employeeLogin = employeeLoginFromJson(jsonString);

import 'dart:convert';

EmployeeLogin employeeLoginFromJson(String str) =>
    EmployeeLogin.fromJson(json.decode(str));

String employeeLoginToJson(EmployeeLogin data) => json.encode(data.toJson());

class EmployeeLogin {
  Loginemp? loginemp;
  String? token;

  EmployeeLogin({
    this.loginemp,
    this.token,
  });

  factory EmployeeLogin.fromJson(Map<String, dynamic> json) => EmployeeLogin(
        loginemp: json["loginemp"] == null
            ? null
            : Loginemp.fromJson(json["loginemp"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "loginemp": loginemp?.toJson(),
        "token": token,
      };
}

class Loginemp {
  int? id;
  String? employeeId;
  String? employeeName;
  String? status;
  String? message;
  bool? isPayment;
  String? paymentMessage;

  Loginemp({
    this.id,
    this.employeeId,
    this.employeeName,
    this.status,
    this.message,
    this.isPayment,
    this.paymentMessage,
  });

  factory Loginemp.fromJson(Map<String, dynamic> json) => Loginemp(
        id: json["id"],
        employeeId: json["employeeId"],
        employeeName: json["employeeName"],
        status: json["status"],
        message: json["message"],
        isPayment: json["isPayment"],
        paymentMessage: json["paymentMessage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employeeId": employeeId,
        "employeeName": employeeName,
        "status": status,
        "message": message,
        "isPayment": isPayment,
        "paymentMessage": paymentMessage,
      };
}
