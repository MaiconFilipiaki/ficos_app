import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ficos_app/config/http_client.dart';
import 'package:ficos_app/config/variables.dart';
import 'package:ficos_app/models/item.dart';

class ItemRepository {

  final HttpClient _httpClient = HttpClient();
  final Dio _dio = Dio();
  final url = "${API}api/v1/prompt_delivery/";
  final urlImg = "${API}api/v1/img/item/";

  Future<String> uploadImage(File file, String idItem) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename:fileName),
    });
    Response response = await this._httpClient.post("${urlImg}${idItem}", formData);
    return 'ok';
  }

  Future<Item> registerItem(Item item, String idPromptDelivery) async {
    String link = "$url$idPromptDelivery/item";
    Response response = await _httpClient.post(
        link, item.toJson()
    );
    if (response.statusCode != 201) {
      throw Exception();
    } else {
      Item newItem = Item.fromJson(response.data);
      return newItem;
    }
  }

  Future<Item> updateItem(Item item, String idPromptDelivery, String idItem) async {
    Response response = await _httpClient.put(
        "$url$idPromptDelivery/item?id=$idItem",
        item
    );
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      Item updateItem = Item.fromJson(response.data);
      return updateItem;
    }
  }

  Future deleteItem(String idItem, String idPromptDelivery) async {
    Response response = await _httpClient.delete("$url$idPromptDelivery/item?id=$idItem");
    if (response.statusCode != 200) {
      throw Exception();
    }
    return;
  }

  Future<String> deleteImgItem(String nameFile, String idItem) async {
    Response response = await this._httpClient.delete("${urlImg}${idItem}?img=${nameFile}");
    return 'ok';
  }
  
  Future<Item> getFindById(int id) async {
    Response response = await _dio.get("${url}null/item?id=${id}");
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      Item item = Item.fromJson(response.data);
      return item;
    }
  }

}