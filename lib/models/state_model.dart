// To parse this JSON data, do
//
//     final stateModel = stateModelFromJson(jsonString);

import 'dart:convert';

StateModel stateModelFromJson(String str) =>
    StateModel.fromJson(json.decode(str));

String stateModelToJson(StateModel data) => json.encode(data.toJson());

class StateModel {
  bool succeeded;
  int statusCode;
  dynamic status;
  String message;
  dynamic error;
  List<StateModelss> data;

  StateModel({
    required this.succeeded,
    required this.statusCode,
    required this.status,
    required this.message,
    required this.error,
    required this.data,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        succeeded: json["succeeded"],
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: List<StateModelss>.from(
            json["data"].map((x) => StateModelss.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "succeeded": succeeded,
        "statusCode": statusCode,
        "status": status,
        "message": message,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class StateModelss {
  int id;
  String sName;

  StateModelss({
    required this.id,
    required this.sName,
  });

  factory StateModelss.fromJson(Map<String, dynamic> json) => StateModelss(
        id: json["id"],
        sName: json["sName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sName": sName,
      };
}
