
import 'package:ficos_app/models/prompt_delivery_model.dart';
import 'package:ficos_app/repositories/prompt_delivery_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'form_prompt_delivery_controller.g.dart';

class FormPromptDeliveryController = _FormPromptDeliveryBase with _$FormPromptDeliveryController;

abstract class _FormPromptDeliveryBase with Store {

  final repositoryPromptDelivery = Modular.get<PromptDeliveryRepository>();

  @observable
  String textError = "";

  @observable
  String textSuccess = "";

  @observable
  TextEditingController controllerTitle = TextEditingController();

  @action
  createdPromptDelivery() async {
    try {
      PromptDelivery promptDeliveryResponse = await repositoryPromptDelivery
          .createdPromptDelivery(
            promptDelivery: new PromptDelivery(
              name: controllerTitle.text
            )
          );
      textSuccess = "Pronta entrega cadastrada com sucesso";
    } catch (expection) {
      if (expection.response = null || expection.response.statusCode == 500) {
        textError = "Houve um erro, por favor tente mais tarde";
        return;
      }
    }
  }

}
