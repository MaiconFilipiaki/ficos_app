// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_prompt_delivery_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditPromptDeliveryController on _EditPromptDeliveryBase, Store {
  final _$controllerMapAtom =
      Atom(name: '_EditPromptDeliveryBase.controllerMap');

  @override
  Completer<GoogleMapController> get controllerMap {
    _$controllerMapAtom.reportRead();
    return super.controllerMap;
  }

  @override
  set controllerMap(Completer<GoogleMapController> value) {
    _$controllerMapAtom.reportWrite(value, super.controllerMap, () {
      super.controllerMap = value;
    });
  }

  final _$textTesteAtom = Atom(name: '_EditPromptDeliveryBase.textTeste');

  @override
  TextEditingController get textTeste {
    _$textTesteAtom.reportRead();
    return super.textTeste;
  }

  @override
  set textTeste(TextEditingController value) {
    _$textTesteAtom.reportWrite(value, super.textTeste, () {
      super.textTeste = value;
    });
  }

  final _$latitudeUserAtom = Atom(name: '_EditPromptDeliveryBase.latitudeUser');

  @override
  double get latitudeUser {
    _$latitudeUserAtom.reportRead();
    return super.latitudeUser;
  }

  @override
  set latitudeUser(double value) {
    _$latitudeUserAtom.reportWrite(value, super.latitudeUser, () {
      super.latitudeUser = value;
    });
  }

  final _$longitudeUserAtom =
      Atom(name: '_EditPromptDeliveryBase.longitudeUser');

  @override
  double get longitudeUser {
    _$longitudeUserAtom.reportRead();
    return super.longitudeUser;
  }

  @override
  set longitudeUser(double value) {
    _$longitudeUserAtom.reportWrite(value, super.longitudeUser, () {
      super.longitudeUser = value;
    });
  }

  final _$cameraPositionMapAtom =
      Atom(name: '_EditPromptDeliveryBase.cameraPositionMap');

  @override
  CameraPosition get cameraPositionMap {
    _$cameraPositionMapAtom.reportRead();
    return super.cameraPositionMap;
  }

  @override
  set cameraPositionMap(CameraPosition value) {
    _$cameraPositionMapAtom.reportWrite(value, super.cameraPositionMap, () {
      super.cameraPositionMap = value;
    });
  }

  final _$valueSlideAtom = Atom(name: '_EditPromptDeliveryBase.valueSlide');

  @override
  double get valueSlide {
    _$valueSlideAtom.reportRead();
    return super.valueSlide;
  }

  @override
  set valueSlide(double value) {
    _$valueSlideAtom.reportWrite(value, super.valueSlide, () {
      super.valueSlide = value;
    });
  }

  final _$circleAtom = Atom(name: '_EditPromptDeliveryBase.circle');

  @override
  Set<Circle> get circle {
    _$circleAtom.reportRead();
    return super.circle;
  }

  @override
  set circle(Set<Circle> value) {
    _$circleAtom.reportWrite(value, super.circle, () {
      super.circle = value;
    });
  }

  final _$changeRadiusSlideAsyncAction =
      AsyncAction('_EditPromptDeliveryBase.changeRadiusSlide');

  @override
  Future changeRadiusSlide(double result) {
    return _$changeRadiusSlideAsyncAction
        .run(() => super.changeRadiusSlide(result));
  }

  final _$positionOfUserAsyncAction =
      AsyncAction('_EditPromptDeliveryBase.positionOfUser');

  @override
  Future positionOfUser() {
    return _$positionOfUserAsyncAction.run(() => super.positionOfUser());
  }

  final _$_EditPromptDeliveryBaseActionController =
      ActionController(name: '_EditPromptDeliveryBase');

  @override
  dynamic completedMap(GoogleMapController controller) {
    final _$actionInfo = _$_EditPromptDeliveryBaseActionController.startAction(
        name: '_EditPromptDeliveryBase.completedMap');
    try {
      return super.completedMap(controller);
    } finally {
      _$_EditPromptDeliveryBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controllerMap: ${controllerMap},
textTeste: ${textTeste},
latitudeUser: ${latitudeUser},
longitudeUser: ${longitudeUser},
cameraPositionMap: ${cameraPositionMap},
valueSlide: ${valueSlide},
circle: ${circle}
    ''';
  }
}
