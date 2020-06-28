import 'dart:io';

import 'package:ficos_app/models/item.dart';
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
  Item item;

  @observable
  String text = "";

  @observable
  TextEditingController textDescription = new TextEditingController();

  @observable
  TextEditingController textPrice = new TextEditingController();

  @observable
  List<File> listFile = List();

  @action
  Future addImage() async {
    var imgSelected = await ImagePicker().getImage(source: ImageSource.gallery);
    if (imgSelected != null) {
      List<File> newListFile = this.listFile;
      newListFile.add(File(imgSelected.path));
      this.listFile = newListFile;
    }
  }

  @action
  Future removeImage(int index) async {
    List<File> newListFile = this.listFile;
    newListFile.removeAt(index);
    this.listFile = newListFile;
  }

  @action
  Future sendFile() async {
    String response = await repositoryItem.uploadImage(this.listFile[0]);
  }

}
