import 'package:dio/dio.dart';
import 'package:ficos_app/config/variables.dart';
import 'package:ficos_app/models/user_model.dart';
import 'package:flutter/cupertino.dart';


class RegisterRepository {

  final Dio _dio = Dio();
  String url = "${API}api/v1/user";


  Future<User> postUser({@required User user}) async {
    Response response = await _dio.post(url, data: user.toJson());
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      return User.fromJson(response.data);
    }
  }


}