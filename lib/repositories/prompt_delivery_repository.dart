import 'package:dio/dio.dart';
import 'package:ficos_app/config/http_client.dart';
import 'package:ficos_app/config/variables.dart';
import 'package:ficos_app/models/prompt_delivery_model.dart';
import 'package:flutter/cupertino.dart';

class PromptDeliveryRepository {

  final HttpClient _httpClient = HttpClient();
  final String url = "${API}api/v1/prompt_delivery";

  Future<PromptDelivery> createdPromptDelivery({@required PromptDelivery promptDelivery}) async {
    Response response = await _httpClient.post(url, promptDelivery.toJson());
    if (response.statusCode != 201) {
      throw Exception();
    } else {
      PromptDelivery promptDelivery = PromptDelivery.fromJson(response.data);
      return promptDelivery;
    }
  }

  Future<PromptDelivery> updatePromptDelivery({@required PromptDelivery promptDelivery}) async {
    Response response = await _httpClient.put("$url?id=${promptDelivery.id}", promptDelivery.toJson());
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      PromptDelivery promptDelivery = PromptDelivery.fromJson(response.data);
      return promptDelivery;
    }
  }

  Future<List<dynamic>> getFindAll() async {
    Response response = await _httpClient.get(url);
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      List<dynamic> listPromptDelivery = response.data.map((i) => PromptDelivery.fromJson(i)).toList();
      return listPromptDelivery;
    }
  }

  Future<PromptDelivery> getById(String idPromptDelivery) async {
    Response response = await _httpClient.get("$url?id=$idPromptDelivery");
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      PromptDelivery promptDelivery = PromptDelivery.fromJson(response.data);
      return promptDelivery;
    }
  }
  
  Future<String> deletePromptDelivery(id) async {
    Response response = await _httpClient.delete("$url?id=$id");
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      return 'ok';
    }
  }

}