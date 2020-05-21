//class RegisterController = _

import 'package:ficos_app/models/user_model.dart';
import 'package:ficos_app/repositories/register_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {

  final api = Modular.get<RegisterRepository>();

  @observable
  String textError = "";

  @observable
  TextEditingController controllerName = TextEditingController();

  @observable
  TextEditingController controllerEmail = TextEditingController();

  @observable
  TextEditingController controllerPassword = TextEditingController();

  @action
  saveUser() async {
    try {
        User user = await api.postUser(
          user: User(
              username: controllerName.text,
              password: controllerPassword.text,
              email: controllerEmail.text
          )
        );
    } catch (exception) {
      if (exception.response == null || exception.response.statusCode == 500) {
        textError = "Houve um erro, por favor tente mais tarde!";
        return;
      }
      if (exception.response.statusCode == 400) {
        textError = "Esse e-mail já foi cadastrado";
        return;
      }
    }
  }
}
