// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_item_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormItemController on _FormItemBase, Store {
  final _$itemAtom = Atom(name: '_FormItemBase.item');

  @override
  ItemTransition get item {
    _$itemAtom.reportRead();
    return super.item;
  }

  @override
  set item(ItemTransition value) {
    _$itemAtom.reportWrite(value, super.item, () {
      super.item = value;
    });
  }

  final _$textAtom = Atom(name: '_FormItemBase.text');

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  final _$textDescriptionAtom = Atom(name: '_FormItemBase.textDescription');

  @override
  TextEditingController get textDescription {
    _$textDescriptionAtom.reportRead();
    return super.textDescription;
  }

  @override
  set textDescription(TextEditingController value) {
    _$textDescriptionAtom.reportWrite(value, super.textDescription, () {
      super.textDescription = value;
    });
  }

  final _$textPriceAtom = Atom(name: '_FormItemBase.textPrice');

  @override
  TextEditingController get textPrice {
    _$textPriceAtom.reportRead();
    return super.textPrice;
  }

  @override
  set textPrice(TextEditingController value) {
    _$textPriceAtom.reportWrite(value, super.textPrice, () {
      super.textPrice = value;
    });
  }

  final _$textDescriptionCompletAtom =
      Atom(name: '_FormItemBase.textDescriptionComplet');

  @override
  TextEditingController get textDescriptionComplet {
    _$textDescriptionCompletAtom.reportRead();
    return super.textDescriptionComplet;
  }

  @override
  set textDescriptionComplet(TextEditingController value) {
    _$textDescriptionCompletAtom
        .reportWrite(value, super.textDescriptionComplet, () {
      super.textDescriptionComplet = value;
    });
  }

  final _$listFileAtom = Atom(name: '_FormItemBase.listFile');

  @override
  List<dynamic> get listFile {
    _$listFileAtom.reportRead();
    return super.listFile;
  }

  @override
  set listFile(List<dynamic> value) {
    _$listFileAtom.reportWrite(value, super.listFile, () {
      super.listFile = value;
    });
  }

  final _$itemCategoriaSelectAtom =
      Atom(name: '_FormItemBase.itemCategoriaSelect');

  @override
  String get itemCategoriaSelect {
    _$itemCategoriaSelectAtom.reportRead();
    return super.itemCategoriaSelect;
  }

  @override
  set itemCategoriaSelect(String value) {
    _$itemCategoriaSelectAtom.reportWrite(value, super.itemCategoriaSelect, () {
      super.itemCategoriaSelect = value;
    });
  }

  final _$listFileRemoveAtom = Atom(name: '_FormItemBase.listFileRemove');

  @override
  List<String> get listFileRemove {
    _$listFileRemoveAtom.reportRead();
    return super.listFileRemove;
  }

  @override
  set listFileRemove(List<String> value) {
    _$listFileRemoveAtom.reportWrite(value, super.listFileRemove, () {
      super.listFileRemove = value;
    });
  }

  final _$listaItensCategoriaAtom =
      Atom(name: '_FormItemBase.listaItensCategoria');

  @override
  List<DropdownMenuItem<String>> get listaItensCategoria {
    _$listaItensCategoriaAtom.reportRead();
    return super.listaItensCategoria;
  }

  @override
  set listaItensCategoria(List<DropdownMenuItem<String>> value) {
    _$listaItensCategoriaAtom.reportWrite(value, super.listaItensCategoria, () {
      super.listaItensCategoria = value;
    });
  }

  final _$addImageAsyncAction = AsyncAction('_FormItemBase.addImage');

  @override
  Future<dynamic> addImage() {
    return _$addImageAsyncAction.run(() => super.addImage());
  }

  final _$removeImageAsyncAction = AsyncAction('_FormItemBase.removeImage');

  @override
  Future<dynamic> removeImage(int index) {
    return _$removeImageAsyncAction.run(() => super.removeImage(index));
  }

  final _$registerItemAsyncAction = AsyncAction('_FormItemBase.registerItem');

  @override
  Future<dynamic> registerItem() {
    return _$registerItemAsyncAction.run(() => super.registerItem());
  }

  final _$deleteItemAsyncAction = AsyncAction('_FormItemBase.deleteItem');

  @override
  Future<dynamic> deleteItem() {
    return _$deleteItemAsyncAction.run(() => super.deleteItem());
  }

  final _$sendFileAsyncAction = AsyncAction('_FormItemBase.sendFile');

  @override
  Future<dynamic> sendFile(String idItem) {
    return _$sendFileAsyncAction.run(() => super.sendFile(idItem));
  }

  @override
  String toString() {
    return '''
item: ${item},
text: ${text},
textDescription: ${textDescription},
textPrice: ${textPrice},
textDescriptionComplet: ${textDescriptionComplet},
listFile: ${listFile},
itemCategoriaSelect: ${itemCategoriaSelect},
listFileRemove: ${listFileRemove},
listaItensCategoria: ${listaItensCategoria}
    ''';
  }
}
