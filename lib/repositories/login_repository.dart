import 'package:dio/dio.dart';
import 'package:ficos_app/config/variables.dart';
import 'package:ficos_app/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginRepositoty {

  final Dio _dio = Dio();
  final storage = new FlutterSecureStorage();
  String url = "${API}api/v1/auth";


  Future<String> login({@required User user }) async {
    Response response = await _dio.post(url, data: user.toJson());
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      await storage.write(key: "token", value: response.data["token"]);
      return 'ok';
    }
  }

}