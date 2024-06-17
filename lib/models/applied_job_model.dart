import 'dart:convert';

AllJobsAppliedApiModel allJobsAppliedApiFromJson(String str) =>
    AllJobsAppliedApiModel.fromJson(json.decode(str));

String allJobsApiToJson(AllJobsAppliedApiModel data) =>
    json.encode(data.toJson());

class AllJobsAppliedApiModel {
  List<JobResponseApplied>? response;
  int? status;
  String? message;

  AllJobsAppliedApiModel({
    this.response,
    this.status,
    this.message,
  });

  factory AllJobsAppliedApiModel.fromJson(Map<String, dynamic> json) =>
      AllJobsAppliedApiModel(
        response: json["response"] == null
            ? []
            : List<JobResponseApplied>.from(
                json["response"].map((x) => JobResponseApplied.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "response": response == null
            ? null
            : List<dynamic>.from(response!.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class JobResponseApplied {
  int? id;
  String? jobTitle;
  String? jobTitleid;
  num? noOfOpening;
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
  String? employeementType;
  String? companyName;
  String? companyImage;

  JobResponseApplied({
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
    this.employeementType,
    this.companyName,
    this.companyImage,
  });

  factory JobResponseApplied.fromJson(Map<String, dynamic> json) =>
      JobResponseApplied(
        id: json["id"],
        jobTitle: json["jobTitle"],
        jobTitleid: json["jobTitleid"],
        //jobTitleid
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
        employeementType: json["employeementType"],
        companyName: json["companyName"],
        companyImage: json["companyImage"],
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
        "employeementType": employeementType,
        "companyName": companyName,
        "companyImage": companyImage,
      };
}
