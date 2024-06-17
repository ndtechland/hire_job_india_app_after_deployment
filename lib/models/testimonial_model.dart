// To parse this JSON data, do
//
//     final allTestimonialModel = allTestimonialModelFromJson(jsonString);

import 'dart:convert';

AllTestimonialModel allTestimonialModelFromJson(String str) =>
    AllTestimonialModel.fromJson(json.decode(str));

String allTestimonialModelToJson(AllTestimonialModel data) =>
    json.encode(data.toJson());

class AllTestimonialModel {
  List<Responsetestimoniall>? response;
  int? status;
  String? message;

  AllTestimonialModel({
    this.response,
    this.status,
    this.message,
  });

  factory AllTestimonialModel.fromJson(Map<String, dynamic> json) =>
      AllTestimonialModel(
        response: json["response"] == null
            ? []
            : List<Responsetestimoniall>.from(
                json["response"]!.map((x) => Responsetestimoniall.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "response": response == null
            ? []
            : List<dynamic>.from(response!.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class Responsetestimoniall {
  int? id;
  String? name;
  String? designation;
  String? paragraph;
  String? fileName;
  String? filePath;
  String? addedBy;
  DateTime? addedOn;
  bool? status;
  dynamic imageFile;

  Responsetestimoniall({
    this.id,
    this.name,
    this.designation,
    this.paragraph,
    this.fileName,
    this.filePath,
    this.addedBy,
    this.addedOn,
    this.status,
    this.imageFile,
  });

  factory Responsetestimoniall.fromJson(Map<String, dynamic> json) =>
      Responsetestimoniall(
        id: json["id"],
        name: json["name"],
        designation: json["designation"],
        paragraph: json["paragraph"],
        fileName: json["fileName"],
        filePath: json["filePath"],
        addedBy: json["addedBy"],
        addedOn:
            json["addedOn"] == null ? null : DateTime.parse(json["addedOn"]),
        status: json["status"],
        imageFile: json["imageFile"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "designation": designation,
        "paragraph": paragraph,
        "fileName": fileName,
        "filePath": filePath,
        "addedBy": addedBy,
        "addedOn": addedOn?.toIso8601String(),
        "status": status,
        "imageFile": imageFile,
      };
}
