// To parse this JSON data, do
//
//     final getProfileEmployeePersonalModel = getProfileEmployeePersonalModelFromJson(jsonString);

import 'dart:convert';

GetProfileEmployeePersonalModel getProfileEmployeePersonalModelFromJson(
        String str) =>
    GetProfileEmployeePersonalModel.fromJson(json.decode(str));

String getProfileEmployeePersonalModelToJson(
        GetProfileEmployeePersonalModel data) =>
    json.encode(data.toJson());

class GetProfileEmployeePersonalModel {
  bool? succeeded;
  int? statusCode;
  String? status;
  String? message;
  dynamic error;
  Data? data;

  GetProfileEmployeePersonalModel({
    this.succeeded,
    this.statusCode,
    this.status,
    this.message,
    this.error,
    this.data,
  });

  factory GetProfileEmployeePersonalModel.fromJson(Map<String, dynamic> json) =>
      GetProfileEmployeePersonalModel(
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
  String? name;
  String? personalEmailAddress;
  num? mobileNumber;
  String? dateOfBirth;
  num? age;
  String? fatherName;
  String? pan;
  String? addressLine1;
  String? addressLine2;
  String? statename;
  String? cityname;
  String? pincode;
  String? aadharNo;
  String? aadharOne;
  String? panimg;
  String? aadharTwo;
  String? profileImage;
  num? stateid;
  num? cityid;

  Data({
    this.name,
    this.personalEmailAddress,
    this.mobileNumber,
    this.dateOfBirth,
    this.age,
    this.fatherName,
    this.pan,
    this.addressLine1,
    this.addressLine2,
    this.statename,
    this.cityname,
    this.pincode,
    this.aadharNo,
    this.aadharOne,
    this.panimg,
    this.aadharTwo,
    this.profileImage,
    this.stateid,
    this.cityid,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        personalEmailAddress: json["personalEmailAddress"],
        mobileNumber: json["mobileNumber"],
        dateOfBirth: json["dateOfBirth"],
        age: json["age"],
        fatherName: json["fatherName"],
        pan: json["pan"],
        addressLine1: json["addressLine1"],
        addressLine2: json["addressLine2"],
        statename: json["statename"],
        cityname: json["cityname"],
        pincode: json["pincode"],
        aadharNo: json["aadharNo"],
        aadharOne: json["aadharOne"],
        panimg: json["panimg"],
        aadharTwo: json["aadharTwo"],
        profileImage: json["profileImage"],
        stateid: json["stateid"],
        cityid: json["cityid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "personalEmailAddress": personalEmailAddress,
        "mobileNumber": mobileNumber,
        "dateOfBirth": dateOfBirth,
        "age": age,
        "fatherName": fatherName,
        "pan": pan,
        "addressLine1": addressLine1,
        "addressLine2": addressLine2,
        "statename": statename,
        "cityname": cityname,
        "pincode": pincode,
        "aadharNo": aadharNo,
        "aadharOne": aadharOne,
        "panimg": panimg,
        "aadharTwo": aadharTwo,
        "profileImage": profileImage,
        "stateid": stateid,
        "cityid": cityid,
      };
}
