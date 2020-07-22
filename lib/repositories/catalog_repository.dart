import 'package:dio/dio.dart';
import 'package:ficos_app/config/variables.dart';
import 'package:ficos_app/models/item.dart';
import 'package:geolocator/geolocator.dart';

class CatalogRepository {

  final Dio _dio = Dio();
  final Geolocator _geo = Geolocator();
  String url = "${API}api/v1/catalog";

  Future<List<dynamic>> getItensCatalog() async {
    Position position = await _geo.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    Response response = await _dio.get("${url}?lat=${position.latitude}&long=${position.longitude}");
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      List<dynamic> listItem = response.data.map((i) => Item.fromJson(i)).toList();
      return listItem;
    }
  }
}