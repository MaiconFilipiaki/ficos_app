import 'package:ficos_app/models/user_model.dart';
import 'package:ficos_app/repositories/login_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';


class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {

  final api = Modular.get<LoginRepositoty>();

  @observable
  String textError = "";

  @observable
  TextEditingController controllerEmail = TextEditingController();

  @observable
  TextEditingController controllerPassword = TextEditingController();

  @action
  login() async {
    try {
      String response = await api.login(
          user: User(
            email: controllerEmail.text,
            password: controllerPassword.text
          )
      );
      if (response.isNotEmpty) {
        Modular.to.pop();
      }
    } catch (exception) {
      if (exception.response == null || exception.response.statusCode == 500) {
        textError = "Houve um erro, por favor tente mais tarde!";
        return;
      }
      if (exception.response.statusCode == 404) {
        textError = "Usuario não encontrado";
        return;
      }
    }
  }

}
