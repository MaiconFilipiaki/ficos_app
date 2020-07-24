
import 'package:ficos_app/pages/Catalog/catalog_page.dart';
import 'package:ficos_app/pages/PromptDelivery/listPrompDelivery/list_prompt_delivery_page.dart';
import 'package:ficos_app/repositories/login_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';


class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  final repositoryLogin = Modular.get<LoginRepositoty>();

  @observable
  Widget page = new Catalog();

  @action
  verifyToken() async {
    try {
      String token = await repositoryLogin.getToken();
      return token;
    } catch (expection) {
      print(expection);
    }
  }

  @action
  showPage() {
      page = new Catalog();
  }

  @action
  showPageTeste() {
    page = new ListPrompDelivery();
  }

}
