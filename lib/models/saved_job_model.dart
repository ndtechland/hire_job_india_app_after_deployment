import 'dart:convert';

AllJobsSavedApiModel allJobsSavedApiFromJson(String str) =>
    AllJobsSavedApiModel.fromJson(json.decode(str));

String allJobsApiToJson(AllJobsSavedApiModel data) =>
    json.encode(data.toJson());

class AllJobsSavedApiModel {
  List<JobResponseSaved>? response;
  int? status;
  String? message;

  AllJobsSavedApiModel({
    this.response,
    this.status,
    this.message,
  });

  factory AllJobsSavedApiModel.fromJson(Map<String, dynamic> json) =>
      AllJobsSavedApiModel(
        response: json["response"] == null
            ? []
            : List<JobResponseSaved>.from(
                json["response"].map((x) => JobResponseSaved.fromJson(x))),
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

class JobResponseSaved {
  int? id;
  int? bookmarkid;
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

  JobResponseSaved({
    this.id,
    this.bookmarkid,
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

  factory JobResponseSaved.fromJson(Map<String, dynamic> json) =>
      JobResponseSaved(
        id: json["id"],
        bookmarkid: json["bookmarkid"],
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
        "bookmarkid": bookmarkid,
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
