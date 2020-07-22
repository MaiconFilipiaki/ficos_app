// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CatalogController on _CatalogControllerBase, Store {
  final _$listItensAtom = Atom(name: '_CatalogControllerBase.listItens');

  @override
  List<dynamic> get listItens {
    _$listItensAtom.reportRead();
    return super.listItens;
  }

  @override
  set listItens(List<dynamic> value) {
    _$listItensAtom.reportWrite(value, super.listItens, () {
      super.listItens = value;
    });
  }

  final _$getListItemAsyncAction =
      AsyncAction('_CatalogControllerBase.getListItem');

  @override
  Future getListItem() {
    return _$getListItemAsyncAction.run(() => super.getListItem());
  }

  @override
  String toString() {
    return '''
listItens: ${listItens}
    ''';
  }
}
