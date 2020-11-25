// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsProductController on _DetailsProductControlllerBase, Store {
  final _$imgsAtom = Atom(name: '_DetailsProductControlllerBase.imgs');

  @override
  List<dynamic> get imgs {
    _$imgsAtom.reportRead();
    return super.imgs;
  }

  @override
  set imgs(List<dynamic> value) {
    _$imgsAtom.reportWrite(value, super.imgs, () {
      super.imgs = value;
    });
  }

  final _$priceAtom = Atom(name: '_DetailsProductControlllerBase.price');

  @override
  String get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(String value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  final _$descricaoExplicativaAtom =
      Atom(name: '_DetailsProductControlllerBase.descricaoExplicativa');

  @override
  String get descricaoExplicativa {
    _$descricaoExplicativaAtom.reportRead();
    return super.descricaoExplicativa;
  }

  @override
  set descricaoExplicativa(String value) {
    _$descricaoExplicativaAtom.reportWrite(value, super.descricaoExplicativa,
        () {
      super.descricaoExplicativa = value;
    });
  }

  final _$descricaoAtom =
      Atom(name: '_DetailsProductControlllerBase.descricao');

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  final _$getItemAsyncAction =
      AsyncAction('_DetailsProductControlllerBase.getItem');

  @override
  Future getItem(int id) {
    return _$getItemAsyncAction.run(() => super.getItem(id));
  }

  @override
  String toString() {
    return '''
imgs: ${imgs},
price: ${price},
descricaoExplicativa: ${descricaoExplicativa},
descricao: ${descricao}
    ''';
  }
}
