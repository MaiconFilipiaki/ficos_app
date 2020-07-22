import 'package:ficos_app/repositories/catalog_repository.dart';
import 'package:ficos_app/repositories/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'catalog_controller.g.dart';

class CatalogController = _CatalogControllerBase with _$CatalogController;

abstract class _CatalogControllerBase with Store {
  final api = Modular.get<CatalogRepository>();

  _CatalogControllerBase() {
    getListItem();
  }

  @observable
  List<dynamic> listItens = [];


  @action
  getListItem() async {
    try {
        List<dynamic> itens = await api.getItensCatalog();
        this.listItens = itens;
    } catch (err) {
      print(err);
    }
  }

}