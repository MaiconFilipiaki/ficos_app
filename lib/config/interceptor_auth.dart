import 'package:dio/dio.dart';
import 'package:ficos_app/app/app_module.dart';
import 'package:ficos_app/config/custom_dio.dart';
import 'package:ficos_app/config/http_client.dart';
import 'package:ficos_app/pages/Login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthIntrcetors extends InterceptorsWrapper {

  LoginController _loginController;
  HttpClient _httpClient;

  AuthIntrcetors() {
    this._loginController = new LoginController();
    this._httpClient = new HttpClient();
  }

  @override
  Future onRequest(RequestOptions options) async {
    String token = await _loginController.getToken();
//    if (token.isEmpty) {
      _httpClient.lock();
      token = await _loginController.refreshToken();
      options.headers.addAll({
        "Authorization": "Bearer $token",
      });
      _httpClient.unlock();
      return options;
//    } else {
//      options.headers.addAll({
//        "Authorization": "Bearer $token",
//      });
//      return options;
//    }
  }

  @override
  Future onResponse(Response response) {
    print("RESPONSE[${response.statusCode}] => PATH: ${response.request.path}");
  }

}