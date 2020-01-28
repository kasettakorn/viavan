// To parse this JSON data, do
//
//     final schoolResult = schoolResultFromJson(jsonString);

import 'dart:convert';

List<SchoolResult> schoolResultFromJson(String str) => List<SchoolResult>.from(json.decode(str).map((x) => SchoolResult.fromJson(x)));

String schoolResultToJson(List<SchoolResult> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<SchoolResult> schoolResultBangkokFromJson(String str) => List<SchoolResult>.from(json.decode(str).map((x) => SchoolResult.fromJson(x))).where((data)=> data.schoolName.contains('เดชา')).toList();

class SchoolResult {
  String schoolId;
  String schoolName;
  String subDistrict;
  String district;
  String province;
  String postCode;
  String schoolType;
  String department;
  String telephone;
  String fax;
  String website;
  String email;
  String latitude;
  String longitude;

  SchoolResult({
    this.schoolId,
    this.schoolName,
    this.subDistrict,
    this.district,
    this.province,
    this.postCode,
    this.schoolType,
    this.department,
    this.telephone,
    this.fax,
    this.website,
    this.email,
    this.latitude,
    this.longitude,
  });

  factory SchoolResult.fromJson(Map<String, dynamic> json) => SchoolResult(
    schoolId: json["SchoolID"],
    schoolName: json["SchoolName"],
    subDistrict: json["SubDistrict"],
    district: json["District"],
    province: json["Province"],
    postCode: json["PostCode"],
    schoolType: json["SchoolType"],
    department: json["Department"],
    telephone: json["Telephone"],
    fax: json["Fax"],
    website: json["Website"],
    email: json["Email"],
    latitude: json["Latitude"],
    longitude: json["Longitude"],
  );

  Map<String, dynamic> toJson() => {
    "SchoolID": schoolId,
    "SchoolName": schoolName,
    "SubDistrict": subDistrict,
    "District": district,
    "Province": province,
    "PostCode": postCode,
    "SchoolType": schoolType,
    "Department": department,
    "Telephone": telephone,
    "Fax": fax,
    "Website": website,
    "Email": email,
    "Latitude": latitude,
    "Longitude": longitude,
  };
}
