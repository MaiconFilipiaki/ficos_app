import 'package:ficos_app/repositories/catalog_repository.dart';
import 'package:ficos_app/repositories/login_repository.dart';
import 'package:ficos_app/repositories/user_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'catalog_controller.g.dart';

class CatalogController = _CatalogControllerBase with _$CatalogController;

abstract class _CatalogControllerBase with Store {
  final api = Modular.get<CatalogRepository>();
  final apiUser = Modular.get<UserRepository>();

  _CatalogControllerBase() {
    getListItem();
    getUsername();
    getToken();
  }

  @observable
  List<dynamic> listItens = [];

  @observable
  String name = '';

  @observable
  String tokenSave;


  @action
  getListItem() async {
    try {
        List<dynamic> itens = await api.getItensCatalog();
        this.listItens = itens;
    } catch (err) {
      print(err);
    }
  }

  @action
  getUsername() async {
    try {
      String username = await apiUser.getUsername();
      if (username != null) {
        name = "Ola $username";
      }
    } catch (err) {
      print(err);
    }
  }

  @action
  getToken() async {
    try {
      String token = await apiUser.getToken();
      tokenSave = token;
    } catch (err) {
      print(err);
    }
  }

  @action
  logout() async {
    try {
      await apiUser.logout();
      Modular.to.pushNamed("/");
    } catch (err) {
      print(err);
    }
  }

}