// To parse this JSON data, do
//
//     final companyDetailByCompanyIdModel = companyDetailByCompanyIdModelFromJson(jsonString);

import 'dart:convert';

CompanyDetailByCompanyIdModel companyDetailByCompanyIdModelFromJson(
        String str) =>
    CompanyDetailByCompanyIdModel.fromJson(json.decode(str));

String companyDetailByCompanyIdModelToJson(
        CompanyDetailByCompanyIdModel data) =>
    json.encode(data.toJson());

class CompanyDetailByCompanyIdModel {
  Response? response;
  int? status;
  String? message;

  CompanyDetailByCompanyIdModel({
    this.response,
    this.status,
    this.message,
  });

  factory CompanyDetailByCompanyIdModel.fromJson(Map<String, dynamic> json) =>
      CompanyDetailByCompanyIdModel(
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
  String? organizationName;
  String? description;
  String? companyImage;
  num? noofopening;
  String? mobileNumber;
  String? email;
  String? officeUrl;
  String? instaLink;
  String? youtubeLink;
  String? linkdnLink;
  String? facebookLink;
  String? tiwtterLink;
  String? companycategoryname;
  String? stateName;
  String? cityName;
  String? bgCompanyImage;
  String? companyAddress;
  List<CjobOpeningss>? cjobOpeningss;

  Response({
    this.id,
    this.organizationName,
    this.description,
    this.companyImage,
    this.noofopening,
    this.mobileNumber,
    this.email,
    this.officeUrl,
    this.instaLink,
    this.youtubeLink,
    this.linkdnLink,
    this.facebookLink,
    this.tiwtterLink,
    this.companycategoryname,
    this.stateName,
    this.cityName,
    this.bgCompanyImage,
    this.companyAddress,
    this.cjobOpeningss,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        organizationName: json["organizationName"],
        description: json["description"],
        companyImage: json["companyImage"],
        noofopening: json["noofopening"],
        mobileNumber: json["mobileNumber"],
        email: json["email"],
        officeUrl: json["officeUrl"],
        instaLink: json["instaLink"],
        youtubeLink: json["youtubeLink"],
        linkdnLink: json["linkdnLink"],
        facebookLink: json["facebookLink"],
        tiwtterLink: json["tiwtterLink"],
        companycategoryname: json["companycategoryname"],
        stateName: json["stateName"],
        cityName: json["cityName"],
        bgCompanyImage: json["bgCompanyImage"],
        companyAddress: json["companyAddress"],
        cjobOpeningss: json["cjobOpeningss"] == null
            ? []
            : List<CjobOpeningss>.from(
                json["cjobOpeningss"]!.map((x) => CjobOpeningss.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "organizationName": organizationName,
        "description": description,
        "companyImage": companyImage,
        "noofopening": noofopening,
        "mobileNumber": mobileNumber,
        "email": email,
        "officeUrl": officeUrl,
        "instaLink": instaLink,
        "youtubeLink": youtubeLink,
        "linkdnLink": linkdnLink,
        "facebookLink": facebookLink,
        "tiwtterLink": tiwtterLink,
        "companycategoryname": companycategoryname,
        "stateName": stateName,
        "cityName": cityName,
        "bgCompanyImage": bgCompanyImage,
        "companyAddress": companyAddress,
        "cjobOpeningss": cjobOpeningss == null
            ? []
            : List<dynamic>.from(cjobOpeningss!.map((x) => x.toJson())),
      };
}

class CjobOpeningss {
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
  dynamic copenjob;

  CjobOpeningss({
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

  factory CjobOpeningss.fromJson(Map<String, dynamic> json) => CjobOpeningss(
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
