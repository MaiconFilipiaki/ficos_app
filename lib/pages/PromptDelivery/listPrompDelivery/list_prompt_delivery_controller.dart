import 'package:ficos_app/models/prompt_delivery_model.dart';
import 'package:ficos_app/repositories/prompt_delivery_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'list_prompt_delivery_controller.g.dart';

class ListPromptDeliveryController = _ListPromptDeliveryBase with _$ListPromptDeliveryController;

abstract class _ListPromptDeliveryBase with Store {

  final repositoryPromptDelivery = Modular.get<PromptDeliveryRepository>();

  _ListPromptDeliveryBase() {
    _getListPromptDelivery();
  }

  @observable
  List<dynamic> listApresentation = [];

  @action
  _getListPromptDelivery() async {
    try {
      List<dynamic> promptDelivery = await repositoryPromptDelivery.getFindAll();
      this.listApresentation = promptDelivery;
    } catch (err) {
      print(err);
    }
  }

  @action
  deleteItem(@required int index) async {
    try {
      PromptDelivery promptDelivery = listApresentation[index];
      await this.repositoryPromptDelivery.deletePromptDelivery(promptDelivery.id);
      List<dynamic> newList = listApresentation;
      newList.remove(PromptDelivery);
      listApresentation = newList;
    } catch (err) {
      print(err);
    }
  }

  @action
  editPromptDelivery(@required PromptDelivery promptDelivery, @required int index) {
    Modular.to.pushNamed('/editPromptDelivery', arguments: promptDelivery);
  }

}
