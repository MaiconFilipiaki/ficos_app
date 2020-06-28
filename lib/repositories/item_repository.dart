import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ficos_app/config/http_client.dart';
import 'package:ficos_app/config/variables.dart';

class ItemRepository {

  final HttpClient _httpClient = HttpClient();
  final url = "${API}api/v1/img/item/1/1";

  Future<String> uploadImage(File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename:fileName),
    });
    Response response = await this._httpClient.post("${url}", formData);
    return 'ok';
  }

}