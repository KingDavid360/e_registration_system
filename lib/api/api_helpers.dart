import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:e_registration_system/api/response_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:e_registration_system/api/api_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class Api {
  var client = http.Client();
  static var header = {'Content-Type': 'application/json'};

  Future post(String url, header, body, {FormData? multimediaRequest}) async {
    var responseJson;
    if (multimediaRequest == null) {
      http.Response res =
          await client.post(Uri.parse(url), headers: header, body: body);
      try {
        // if (res.statusCode == 200) {
        //   return _processResponse(res);
        // } else if (res.statusCode == 401) {
        //   print('User already exist, with status: ${res.statusCode}');
        //   return res.body;
        // } else {
        //   print('Request failed with status: ${res.statusCode}');
        //   return res.body;
        // }
        responseJson = await responseHandler(res);
      } on SocketException {
        //network error
        throw NetworkException("Network error occurred");
      }
      return responseJson;
    } else {
      Dio dio = Dio();
      try {
        Response res = await dio.post(
          url,
          data: multimediaRequest,
          options: Options(
              method: "POST",
              contentType: "application/json",
              headers: header,
              responseType: ResponseType.plain),
        );
        print(res.data);
        print(res.statusCode);
        return res.data;
      } catch (e) {
        print(e);
      }
    }
  }
}
