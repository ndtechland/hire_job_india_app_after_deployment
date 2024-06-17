// To parse this JSON data, do
//
//     final leaveDropdownModels = leaveDropdownModelsFromJson(jsonString);

import 'dart:convert';

LeaveDropdownModels leaveDropdownModelsFromJson(String str) =>
    LeaveDropdownModels.fromJson(json.decode(str));

String leaveDropdownModelsToJson(LeaveDropdownModels data) =>
    json.encode(data.toJson());

class LeaveDropdownModels {
  bool? succeeded;
  int? statusCode;
  String? status;
  String? message;
  dynamic error;
  Data? data;

  LeaveDropdownModels({
    this.succeeded,
    this.statusCode,
    this.status,
    this.message,
    this.error,
    this.data,
  });

  factory LeaveDropdownModels.fromJson(Map<String, dynamic> json) =>
      LeaveDropdownModels(
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
  List<GetLeaveList>? getLeaveList;
  List<GetLeaveTypeList>? getLeaveTypeList;

  Data({
    this.getLeaveList,
    this.getLeaveTypeList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        getLeaveList: json["getLeaveList"] == null
            ? []
            : List<GetLeaveList>.from(
                json["getLeaveList"]!.map((x) => GetLeaveList.fromJson(x))),
        getLeaveTypeList: json["getLeaveTypeList"] == null
            ? []
            : List<GetLeaveTypeList>.from(json["getLeaveTypeList"]!
                .map((x) => GetLeaveTypeList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "getLeaveList": getLeaveList == null
            ? []
            : List<dynamic>.from(getLeaveList!.map((x) => x.toJson())),
        "getLeaveTypeList": getLeaveTypeList == null
            ? []
            : List<dynamic>.from(getLeaveTypeList!.map((x) => x.toJson())),
      };
}

class GetLeaveList {
  int? id;
  String? typeofleave;
  bool? isactive;
  DateTime? createddate;

  GetLeaveList({
    this.id,
    this.typeofleave,
    this.isactive,
    this.createddate,
  });

  factory GetLeaveList.fromJson(Map<String, dynamic> json) => GetLeaveList(
        id: json["id"],
        typeofleave: json["typeofleave"],
        isactive: json["isactive"],
        createddate: json["createddate"] == null
            ? null
            : DateTime.parse(json["createddate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "typeofleave": typeofleave,
        "isactive": isactive,
        "createddate": createddate?.toIso8601String(),
      };
}

class GetLeaveTypeList {
  int? id;
  String? leavetype;
  double? leaveValue;
  bool? isactive;

  GetLeaveTypeList({
    this.id,
    this.leavetype,
    this.leaveValue,
    this.isactive,
  });

  factory GetLeaveTypeList.fromJson(Map<String, dynamic> json) =>
      GetLeaveTypeList(
        id: json["id"],
        leavetype: json["leavetype"],
        leaveValue: json["leaveValue"]?.toDouble(),
        isactive: json["isactive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "leavetype": leavetype,
        "leaveValue": leaveValue,
        "isactive": isactive,
      };
}
