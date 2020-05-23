import 'package:dio/dio.dart';
import 'package:ficos_app/config/interceptor_auth.dart';
import 'package:ficos_app/config/variables.dart';

import 'interceptors.dart';

class CustomDio {

  final Dio client;

  CustomDio(this.client){
    client.options.baseUrl = API;
    client.interceptors.add(CustomIntercetors());
    client.interceptors.add(AuthIntrcetors());
    client. options.connectTimeout = 5000;
  }

}