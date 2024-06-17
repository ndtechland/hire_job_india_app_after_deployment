// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  LoginProfile loginProfile;

  Message({
    required this.loginProfile,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        loginProfile: LoginProfile.fromJson(json["loginProfile"]),
      );

  Map<String, dynamic> toJson() => {
        "loginProfile": loginProfile.toJson(),
      };
}

class LoginProfile {
  int id;
  String fullName;
  String emailId;
  int mobileNumber;
  String experience;
  String genderName;

  LoginProfile({
    required this.id,
    required this.fullName,
    required this.emailId,
    required this.mobileNumber,
    required this.experience,
    required this.genderName,
  });

  factory LoginProfile.fromJson(Map<String, dynamic> json) => LoginProfile(
        id: json["id"],
        fullName: json["fullName"],
        emailId: json["emailID"],
        mobileNumber: json["mobileNumber"],
        experience: json["experience"],
        genderName: json["genderName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "emailID": emailId,
        "mobileNumber": mobileNumber,
        "experience": experience,
        "genderName": genderName,
      };
}
