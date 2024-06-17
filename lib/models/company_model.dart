class CompanyResponse {
  final List<Company>? response;
  final int? status;
  final String? message;

  CompanyResponse({
    this.response,
    this.status,
    this.message,
  });

  factory CompanyResponse.fromJson(Map<String, dynamic> json) {
    var list = json['response'] as List<dynamic>?;
    List<Company>? responseList =
        list != null ? list.map((i) => Company.fromJson(i)).toList() : null;

    return CompanyResponse(
      response: responseList,
      status: json['status'] as int?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'response': response?.map((company) => company.toJson()).toList(),
      'status': status,
      'message': message,
    };
  }
}

class Company {
  final num? id;
  final String? organizationName;
  final String? description;
  final String? companyImage;
  final num? noofopening;

  Company({
    this.id,
    this.organizationName,
    this.description,
    this.companyImage,
    this.noofopening,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'] as int?,
      organizationName: json['organizationName'] as String?,
      description: json['description'] as String?,
      companyImage: json['companyImage'] as String?,
      noofopening: json['noofopening'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'organizationName': organizationName,
      'description': description,
      'companyImage': companyImage,
      'noofopening': noofopening,
    };
  }
}
