// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_prompt_delivery_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListPromptDeliveryController on _ListPromptDeliveryBase, Store {
  final _$listApresentationAtom =
      Atom(name: '_ListPromptDeliveryBase.listApresentation');

  @override
  List<dynamic> get listApresentation {
    _$listApresentationAtom.reportRead();
    return super.listApresentation;
  }

  @override
  set listApresentation(List<dynamic> value) {
    _$listApresentationAtom.reportWrite(value, super.listApresentation, () {
      super.listApresentation = value;
    });
  }

  final _$_getListPromptDeliveryAsyncAction =
      AsyncAction('_ListPromptDeliveryBase._getListPromptDelivery');

  @override
  Future _getListPromptDelivery() {
    return _$_getListPromptDeliveryAsyncAction
        .run(() => super._getListPromptDelivery());
  }

  final _$deleteItemAsyncAction =
      AsyncAction('_ListPromptDeliveryBase.deleteItem');

  @override
  Future deleteItem(@required int index) {
    return _$deleteItemAsyncAction.run(() => super.deleteItem(index));
  }

  final _$_ListPromptDeliveryBaseActionController =
      ActionController(name: '_ListPromptDeliveryBase');

  @override
  dynamic editPromptDelivery(
      @required PromptDelivery promptDelivery, @required int index) {
    final _$actionInfo = _$_ListPromptDeliveryBaseActionController.startAction(
        name: '_ListPromptDeliveryBase.editPromptDelivery');
    try {
      return super.editPromptDelivery(promptDelivery, index);
    } finally {
      _$_ListPromptDeliveryBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listApresentation: ${listApresentation}
    ''';
  }
}
