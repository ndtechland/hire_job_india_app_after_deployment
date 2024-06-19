// // To parse this JSON data, do
// //
// //     final getProfileModel = getProfileModelFromJson(jsonString);
//
// import 'dart:convert';
//
// GetProfileModel getProfileModelFromJson(String str) =>
//     GetProfileModel.fromJson(json.decode(str));
//
// String getProfileModelToJson(GetProfileModel data) =>
//     json.encode(data.toJson());
//
// class GetProfileModel {
//   Response? response;
//   int? status;
//   String? message;
//
//   GetProfileModel({
//     this.response,
//     this.status,
//     this.message,
//   });
//
//   factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
//       GetProfileModel(
//         response: json["response"] == null
//             ? null
//             : Response.fromJson(json["response"]),
//         status: json["status"],
//         message: json["message"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "response": response?.toJson(),
//         "status": status,
//         "message": message,
//       };
// }
//
// class Response {
//   String? fullName;
//   String? emailId;
//   num? mobileNumber;
//   String? experience;
//   String? stateName;
//   String? cityName;
//   String? genderName;
//   String? dateofbirth;
//   String? resumeFilePath;
//   num? pincode;
//   String? address;
//   String? profileImage;
//
//   Response({
//     this.fullName,
//     this.emailId,
//     this.mobileNumber,
//     this.experience,
//     this.stateName,
//     this.cityName,
//     this.genderName,
//     this.dateofbirth,
//     this.resumeFilePath,
//     this.pincode,
//     this.address,
//     this.profileImage,
//   });
//
//   factory Response.fromJson(Map<String, dynamic> json) => Response(
//         fullName: json["fullName"],
//         emailId: json["emailID"],
//         mobileNumber: json["mobileNumber"],
//         experience: json["experience"],
//         stateName: json["stateName"],
//         cityName: json["cityName"],
//         genderName: json["genderName"],
//         dateofbirth: json["dateofbirth"],
//         resumeFilePath: json["resumeFilePath"],
//         pincode: json["pincode"],
//         address: json["address"],
//         profileImage: json["profileImage"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "fullName": fullName,
//         "emailID": emailId,
//         "mobileNumber": mobileNumber,
//         "experience": experience,
//         "stateName": stateName,
//         "cityName": cityName,
//         "genderName": genderName,
//         "dateofbirth": dateofbirth,
//         "resumeFilePath": resumeFilePath,
//         "pincode": pincode,
//         "address": address,
//         "profileImage": profileImage,
//       };
// }

///..
import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) =>
    json.encode(data.toJson());

class GetProfileModel {
  Response? response;
  int? status;
  String? message;

  GetProfileModel({
    this.response,
    this.status,
    this.message,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
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
  num? id;
  String? fullName;
  String? emailId;
  int? mobileNumber;
  String? experience;
  String? stateName;
  String? cityName;
  String? genderName;
  String? dateofbirth;
  String? resumeFilePath;
  num? pincode;
  String? address;
  String? profileImage;
  double? currentCtc;
  double? expectedCtc;
  num? stateid;
  num? cityid;

  Response({
    this.id,
    this.fullName,
    this.emailId,
    this.mobileNumber,
    this.experience,
    this.stateName,
    this.cityName,
    this.genderName,
    this.dateofbirth,
    this.resumeFilePath,
    this.pincode,
    this.address,
    this.profileImage,
    this.currentCtc,
    this.expectedCtc,
    this.stateid,
    this.cityid,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        fullName: json["fullName"],
        emailId: json["emailID"],
        mobileNumber: json["mobileNumber"],
        experience: json["experience"],
        stateName: json["stateName"],
        cityName: json["cityName"],
        genderName: json["genderName"],
        dateofbirth: json["dateofbirth"],
        resumeFilePath: json["resumeFilePath"],
        pincode: json["pincode"],
        address: json["address"],
        profileImage: json["profileImage"],
        currentCtc: json["currentCTC"],
        expectedCtc: json["expectedCTC"],
        stateid: json["stateid"],
        cityid: json["cityid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "emailID": emailId,
        "mobileNumber": mobileNumber,
        "experience": experience,
        "stateName": stateName,
        "cityName": cityName,
        "genderName": genderName,
        "dateofbirth": dateofbirth,
        "resumeFilePath": resumeFilePath,
        "pincode": pincode,
        "address": address,
        "profileImage": profileImage,
        "currentCTC": currentCtc,
        "expectedCTC": expectedCtc,
        "stateid": stateid,
        "cityid": cityid,
      };
}
