// To parse this JSON data, do
//
//     final allcatModell = allcatModellFromJson(jsonString);

class PostedByModel {
  final List<PostedByItem> getPostedbyList;
  final int status;
  final String message;

  PostedByModel({
    required this.getPostedbyList,
    required this.status,
    required this.message,
  });

  factory PostedByModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> postedByList = json['response']['getPostedbyList'];
    List<PostedByItem> getPostedbyList =
        postedByList.map((item) => PostedByItem.fromJson(item)).toList();
    return PostedByModel(
      getPostedbyList: getPostedbyList,
      status: json['status'],
      message: json['message'],
    );
  }
}

class PostedByItem {
  final num id;
  final String postedtype;
  final String addedOn;
  final bool status;
  final bool isDelete;
  final num addedBy;
  final String postedImage;
  final num noofopening;
  final dynamic imageFile;
  final dynamic statusddl;

  PostedByItem({
    required this.id,
    required this.postedtype,
    required this.addedOn,
    required this.status,
    required this.isDelete,
    required this.addedBy,
    required this.postedImage,
    required this.noofopening,
    required this.imageFile,
    required this.statusddl,
  });

  factory PostedByItem.fromJson(Map<String, dynamic> json) {
    return PostedByItem(
      id: json['id'],
      postedtype: json['postedtype'],
      addedOn: json['addedOn'],
      status: json['status'],
      isDelete: json['isDelete'],
      addedBy: json['addedBy'],
      postedImage: json['postedImage'],
      noofopening: json['noofopening'],
      imageFile: json['imageFile'],
      statusddl: json['statusddl'],
    );
  }
}

///

// import 'dart:convert';
//
// AllcatModell allcatModellFromJson(String str) =>
//     AllcatModell.fromJson(json.decode(str));
//
// String allcatModellToJson(AllcatModell data) => json.encode(data.toJson());
//
// class AllcatModell {
//   Responsecat? responsecat;
//   num? status;
//   String? message;
//
//   AllcatModell({
//     this.responsecat,
//     this.status,
//     this.message,
//   });
//
//   factory AllcatModell.fromJson(Map<String, dynamic> json) => AllcatModell(
//         responsecat: json["responsecat"] == null
//             ? null
//             : Responsecat.fromJson(json["responsecat"]),
//         status: json["status"],
//         message: json["message"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "responsecat": responsecat?.toJson(),
//         "status": status,
//         "message": message,
//       };
// }
//
// class Responsecat {
//   List<GetAllCatList>? getAllCatList;
//
//   Responsecat({
//     this.getAllCatList,
//   });
//
//   factory Responsecat.fromJson(Map<String, dynamic> json) => Responsecat(
//         getAllCatList: json["GetAllCatList"] == null
//             ? []
//             : List<GetAllCatList>.from(
//                 json["GetAllCatList"]!.map((x) => GetAllCatList.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "GetAllCatList": getAllCatList == null
//             ? []
//             : List<dynamic>.from(getAllCatList!.map((x) => x.toJson())),
//       };
// }
//
// class GetAllCatList {
//   num? id;
//   String? postedtype;
//   DateTime? addedOn;
//   bool? status;
//   bool? isDelete;
//   num? addedBy;
//   String? postedImage;
//   num? noofopening;
//
//   GetAllCatList({
//     this.id,
//     this.postedtype,
//     this.addedOn,
//     this.status,
//     this.isDelete,
//     this.addedBy,
//     this.postedImage,
//     this.noofopening,
//   });
//
//   factory GetAllCatList.fromJson(Map<String, dynamic> json) => GetAllCatList(
//         id: json["id"],
//         postedtype: json["postedtype"],
//         addedOn:
//             json["addedOn"] == null ? null : DateTime.parse(json["addedOn"]),
//         status: json["status"],
//         isDelete: json["isDelete"],
//         addedBy: json["addedBy"],
//         postedImage: json["postedImage"],
//         noofopening: json["noofopening"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "postedtype": postedtype,
//         "addedOn": addedOn?.toIso8601String(),
//         "status": status,
//         "isDelete": isDelete,
//         "addedBy": addedBy,
//         "postedImage": postedImage,
//         "noofopening": noofopening,
//       };
// }
