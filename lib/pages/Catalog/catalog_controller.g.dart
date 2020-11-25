// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

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

  final _$nameAtom = Atom(name: '_CatalogControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$tokenSaveAtom = Atom(name: '_CatalogControllerBase.tokenSave');

  @override
  String get tokenSave {
    _$tokenSaveAtom.reportRead();
    return super.tokenSave;
  }

  @override
  set tokenSave(String value) {
    _$tokenSaveAtom.reportWrite(value, super.tokenSave, () {
      super.tokenSave = value;
    });
  }

  final _$getListItemAsyncAction =
      AsyncAction('_CatalogControllerBase.getListItem');

  @override
  Future getListItem() {
    return _$getListItemAsyncAction.run(() => super.getListItem());
  }

  final _$getUsernameAsyncAction =
      AsyncAction('_CatalogControllerBase.getUsername');

  @override
  Future getUsername() {
    return _$getUsernameAsyncAction.run(() => super.getUsername());
  }

  final _$getTokenAsyncAction = AsyncAction('_CatalogControllerBase.getToken');

  @override
  Future getToken() {
    return _$getTokenAsyncAction.run(() => super.getToken());
  }

  final _$logoutAsyncAction = AsyncAction('_CatalogControllerBase.logout');

  @override
  Future logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''
listItens: ${listItens},
name: ${name},
tokenSave: ${tokenSave}
    ''';
  }
}
