import 'dart:convert';

import 'package:e_registration_system/api/model/RegistrationModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api_helpers.dart';
import '../api_routes.dart';

class ClientController extends GetxController {
  static ClientController get instance => Get.find();

  Map<String, String> get header => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        //'Authorization': 'Bearer ${locator<UserInfoCache>().token}',
      };

  RegistrationModel registrationModel = RegistrationModel();
  Future<bool> registerClient({
    String? staffId,
    String? nin,
    String? email,
    String? firstName,
    String? lastName,
    String? middleName,
    String? gender,
    String? phoneNumber,
    String? birthday,
    String? institution,
    String? typeOfInstitution,
    String? address,
    String? city,
    String? state,
    String? gradeLevel,
    String? course,
  }) async {
    try {
      Map<String, dynamic> val = {
        "staff_id": staffId,
        "nin": nin,
        "first_name": firstName,
        "last_name": lastName,
        "middle_name": middleName,
        "phone_number": phoneNumber,
        "type_of_institution": typeOfInstitution,
        "institution": institution,
        "address": address,
        "city": city,
        "state": state,
        "grade_level": gradeLevel,
        "birthday": birthday,
        "email": email,
        "gender": gender,
        "course": course,
      };
      var responseBody = await Api().post(
        ApiRoute.register,
        header,
        jsonEncode(val),
      );
      var response = jsonDecode(responseBody);
      print(responseBody);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
