import 'dart:convert';

String registrationModelToJson(RegistrationModel data) =>
    json.encode(data.toJson());

class RegistrationModel {
  int? status;
  String? message;
  List<Datum>? data;

  RegistrationModel({
    this.status,
    this.message,
    this.data,
  });

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
  String? staffId;
  String? nin;
  String? email;
  String? firstName;
  String? lastName;
  String? middleName;
  String? gender;
  String? phoneNumber;
  String? birthday;
  String? institution;
  String? typeOfInstitution;
  String? address;
  String? city;
  String? state;
  String? gradeLevel;
  String? course;

  Datum({
    this.id,
    this.staffId,
    this.nin,
    this.email,
    this.firstName,
    this.lastName,
    this.middleName,
    this.gender,
    this.phoneNumber,
    this.birthday,
    this.institution,
    this.typeOfInstitution,
    this.address,
    this.city,
    this.state,
    this.gradeLevel,
    this.course,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "staff_id": staffId,
        "nin": nin,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "middle_name": middleName,
        "gender": gender,
        "phone_number": phoneNumber,
        // "birthday":
        //     "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
        "institution": institution,
        "birthday": birthday,
        "type_of_institution": typeOfInstitution,
        "address": address,
        "city": city,
        "state": state,
        "grade_level": gradeLevel,
        "course": course,
      };
}
