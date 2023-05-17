import 'dart:async';
import 'dart:io';
import 'package:e_registration_system/api/response_handler.dart';
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
        responseJson = await responseHandler(res);
      } on SocketException {
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

  Future get(String url, header, {hideLog = false}) async {
    var responseJson;

    try {
      http.Response res;
      if (header != null) {
        res = await client.get(Uri.parse(url), headers: header);
      } else {
        res = await client.get(Uri.parse(url));
      }
      responseJson = responseHandler(res, hideLog: hideLog);
    } on SocketException {
      //network error
      throw NetworkException("Network error occurred");
    }

    return responseJson;
  }
}
