//class RegisterController = _

import 'package:ficos_app/repositories/register_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {

  final api = Modular.get<RegisterRepository>();

  _RegisterControllerBase() {
    saveUser();
  }

  @observable
  TextEditingController controllerName = TextEditingController();

  @observable
  TextEditingController controllerEmail = TextEditingController();

  @observable
  TextEditingController controllerPassword = TextEditingController();

  @action
  saveUser() {
    print("Maicon" + controllerName.text + controllerEmail.text + controllerPassword.text);
  }
}
