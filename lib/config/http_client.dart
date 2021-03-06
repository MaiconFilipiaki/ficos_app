import 'package:dio/dio.dart';
import 'package:ficos_app/config/interceptor_auth.dart';
import 'package:ficos_app/config/variables.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HttpClient {

  Dio _client;
  FlutterSecureStorage _flutterSecureStorage;

  HttpClient() {
    _client = new Dio();
    _flutterSecureStorage = new FlutterSecureStorage();
  }

  Future<void> _interceptor() async {
    String token = await _flutterSecureStorage.read(key: "token");
    Map<String, dynamic> headers = {};
//    if (token != null) headers["Authorization"] = 'Bearer $token';
//    _client.options.headers = headers;
    _client.interceptors.add(AuthIntrcetors());
    _client.options.baseUrl = API;
  }

  Future<Response> get(String url) async {
    await _interceptor();
    return _client.get(url);
  }

  Future<Response> post(String url, data) async {
    await _interceptor();
    return _client.post(url, data: data);
  }

  Future<Response> delete(String url) async {
    await _interceptor();
    return _client.delete(url);
  }

  Future<Response> put(String url, data) async {
    await _interceptor();
    return _client.put(url, data: data);
  }

  Future lock() {
     _client.lock();
  }

  Future unlock() {
    _client.unlock();
  }

}