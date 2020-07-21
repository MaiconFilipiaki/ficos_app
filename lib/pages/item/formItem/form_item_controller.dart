import 'dart:io';

import 'package:ficos_app/models/item.dart';
import 'package:ficos_app/models/itemTransition.dart';
import 'package:ficos_app/repositories/item_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'form_item_controller.g.dart';

class FormItemController = _FormItemBase with _$FormItemController;

abstract class _FormItemBase with Store {

  final repositoryItem = Modular.get<ItemRepository>();

  @observable
  ItemTransition item;

  @observable
  String text = "";

  @observable
  TextEditingController textDescription = new TextEditingController();

  @observable
  TextEditingController textPrice = new TextEditingController();

  @observable
  List<dynamic> listFile = [];

  @observable
  List<String> listFileRemove = [];

  @action
  Future addImage() async {
    var imgSelected = await ImagePicker().getImage(source: ImageSource.gallery);
    if (imgSelected != null) {
      List<dynamic> newListFile = this.listFile;
      newListFile.add(File(imgSelected.path));
      this.listFile = newListFile;
    }
  }

  @action
  Future removeImage(int index) async {
    List<dynamic> newListFile = this.listFile;
    if (newListFile[index] is String) {
      List<dynamic> newListFileRemove = this.listFileRemove;
      newListFileRemove.add(newListFile[index]);
      this.listFileRemove = newListFileRemove;
    }
    newListFile.removeAt(index);
    this.listFile = newListFile;
  }

  @action
  Future registerItem() async {
    try {
      if (item.id == null) {
        Item newItem = new Item(
            description: textDescription.text,
            price: textPrice.text
        );
        Item itemResponse = await repositoryItem.registerItem(
            newItem,
            item.idPromptDelivery.toString()
        );
        this.sendFile(itemResponse.id.toString());
        print(itemResponse);
      } else {
        Item updateItem = new Item(
          description: textDescription.text,
          price: textPrice.text
        );
        Item itemResponse = await repositoryItem.updateItem(
          updateItem,
          item.idPromptDelivery.toString(),
          item.id.toString(),
        );
        this.sendFile(item.id.toString());
      }
    } catch (err) {
      print('ERROR' + err);
    }
  }


  @action
  Future sendFile(String idItem) async {
    for (int i = 0; i < listFile.length; i++) {
      if (listFile[i] is File) {
        String response = await repositoryItem.uploadImage(listFile[i], idItem);
      }
    }
    for (int i = 0; i < listFileRemove.length; i++) {
      print(listFileRemove[i]);
      List<String> splitString = listFileRemove[i].split('/');
      String nameFile = splitString[splitString.length - 1];
      String response = await repositoryItem.deleteImgItem(nameFile, idItem);
    }
    Modular.to.pop("Teste");
  }

}
