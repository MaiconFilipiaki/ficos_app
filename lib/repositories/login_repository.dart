import 'package:dio/dio.dart';
import 'package:ficos_app/config/custom_dio.dart';
import 'package:ficos_app/config/http_client.dart';
import 'package:ficos_app/config/variables.dart';
import 'package:ficos_app/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginRepositoty {

  final Dio _dio = Dio();
  final storage = new FlutterSecureStorage();
  final HttpClient _httpClient = HttpClient();
  String url = "${API}api/v1/auth";



  Future teste() async {
    Response response = await _httpClient.get("api/v1/catalog");
  }

  Future<String> login({@required User user }) async {
    Response response = await _dio.post(url, data: user.toJson());
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      await storage.write(key: "token", value: response.data["token"]);
      await storage.write(key: "email", value: user.email);
      await storage.write(key: "password", value: user.password);
      return response.data["token"];
    }
  }

  Future<User> returnUserSaveLocal() async {
    User user = new User();
    user.email = await storage.read(key: "email");
    user.password = await storage.read(key: "password");
    return user;
  }

  Future<String> getToken() async {
    String token = await storage.read(key: "token");
    return token;
  }
}