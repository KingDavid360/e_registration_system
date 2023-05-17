// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

CourseModel courseModelFromJson(String str) =>
    CourseModel.fromJson(json.decode(str));

String courseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
  int? status;
  String? message;
  List<Datum>? data;

  CourseModel({
    this.status,
    this.message,
    this.data,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? course;

  Datum({
    this.id,
    this.course,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        course: json["course"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course": course,
      };
}
