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
      return PromptDelivery.fromJson(response.data);
    }
  }

}