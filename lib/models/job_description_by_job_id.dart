// To parse this JSON data, do
//
//     final jobdetailbyjobIdModel = jobdetailbyjobIdModelFromJson(jsonString);

import 'dart:convert';

JobdetailbyjobIdModel jobdetailbyjobIdModelFromJson(String str) =>
    JobdetailbyjobIdModel.fromJson(json.decode(str));

String jobdetailbyjobIdModelToJson(JobdetailbyjobIdModel data) =>
    json.encode(data.toJson());

class JobdetailbyjobIdModel {
  Response? response;
  int? status;
  String? message;

  JobdetailbyjobIdModel({
    this.response,
    this.status,
    this.message,
  });

  factory JobdetailbyjobIdModel.fromJson(Map<String, dynamic> json) =>
      JobdetailbyjobIdModel(
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "response": response?.toJson(),
        "status": status,
        "message": message,
      };
}

class Response {
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
  dynamic qualificationName;
  String? employeementType;
  dynamic postedBy;
  dynamic workMode;
  dynamic stateName;
  dynamic cityName;
  String? companyName;
  String? companyImage;
  String? companyDescription;
  String? qualificationDescription;
  String? aboutDescription;
  String? responsebilitiesDescription;
  dynamic copenjob;

  Response({
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
    this.copenjob,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
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
        copenjob: json["copenjob"],
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
        "copenjob": copenjob,
      };
}
