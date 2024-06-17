// To parse this JSON data, do
//
//     final allJobsbyCatIdModel = allJobsbyCatIdModelFromJson(jsonString);

import 'dart:convert';

AllJobsbyCatIdModel allJobsbyCatIdModelFromJson(String str) =>
    AllJobsbyCatIdModel.fromJson(json.decode(str));

String allJobsbyCatIdModelToJson(AllJobsbyCatIdModel data) =>
    json.encode(data.toJson());

class AllJobsbyCatIdModel {
  List<AllJobCatID>? response;
  int? status;
  String? message;

  AllJobsbyCatIdModel({
    this.response,
    this.status,
    this.message,
  });

  factory AllJobsbyCatIdModel.fromJson(Map<String, dynamic> json) =>
      AllJobsbyCatIdModel(
        response: json["response"] == null
            ? []
            : List<AllJobCatID>.from(
                json["response"]!.map((x) => AllJobCatID.fromJson(x))),
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

class AllJobCatID {
  int? id;
  String? jobTitle;
  String? jobTitleid;
  int? noOfOpening;
  String? location;
  String? requiredExperience;
  String? jobDescription;
  String? department;
  String? addedBy;
  DateTime? addedOn;
  bool? status;
  String? package;
  String? noofdays;
  String? skills;
  String? qualificationName;
  String? employeementType;
  String? postedBy;
  String? workMode;
  String? stateName;
  String? cityName;
  String? companyName;
  String? companyImage;
  String? companyDescription;
  String? qualificationDescription;
  String? aboutDescription;
  String? responsebilitiesDescription;
  // dynamic copenjob;

  AllJobCatID({
    this.id,
    this.jobTitle,
    this.jobTitleid,
    this.noOfOpening,
    this.location,
    this.requiredExperience,
    this.jobDescription,
    this.department,
    this.addedBy,
    this.addedOn,
    this.status,
    this.package,
    this.noofdays,
    this.skills,
    this.qualificationName,
    this.employeementType,
    this.postedBy,
    this.workMode,
    this.stateName,
    this.cityName,
    this.companyName,
    this.companyImage,
    this.companyDescription,
    this.qualificationDescription,
    this.aboutDescription,
    this.responsebilitiesDescription,
    //this.copenjob,
  });

  factory AllJobCatID.fromJson(Map<String, dynamic> json) => AllJobCatID(
        id: json["id"],
        jobTitle: json["jobTitle"],
        jobTitleid: json["jobTitleid"],
        noOfOpening: json["noOfOpening"],
        location: json["location"],
        requiredExperience: json["requiredExperience"],
        jobDescription: json["jobDescription"],
        department: json["department"],
        addedBy: json["addedBy"],
        addedOn:
            json["addedOn"] == null ? null : DateTime.parse(json["addedOn"]),
        status: json["status"],
        package: json["package"],
        noofdays: json["noofdays"],
        skills: json["skills"],
        qualificationName: json["qualificationName"],
        employeementType: json["employeementType"],
        postedBy: json["postedBy"],
        workMode: json["workMode"],
        stateName: json["stateName"],
        cityName: json["cityName"],
        companyName: json["companyName"],
        companyImage: json["companyImage"],
        companyDescription: json["companyDescription"],
        qualificationDescription: json["qualificationDescription"],
        aboutDescription: json["aboutDescription"],
        responsebilitiesDescription: json["responsebilitiesDescription"],
        //copenjob: json["copenjob"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jobTitle": jobTitle,
        "jobTitleid": jobTitleid,
        "noOfOpening": noOfOpening,
        "location": location,
        "requiredExperience": requiredExperience,
        "jobDescription": jobDescription,
        "department": department,
        "addedBy": addedBy,
        "addedOn": addedOn?.toIso8601String(),
        "status": status,
        "package": package,
        "noofdays": noofdays,
        "skills": skills,
        "qualificationName": qualificationName,
        "employeementType": employeementType,
        "postedBy": postedBy,
        "workMode": workMode,
        "stateName": stateName,
        "cityName": cityName,
        "companyName": companyName,
        "companyImage": companyImage,
        "companyDescription": companyDescription,
        "qualificationDescription": qualificationDescription,
        "aboutDescription": aboutDescription,
        "responsebilitiesDescription": responsebilitiesDescription,
        // "copenjob": copenjob,
      };
}
