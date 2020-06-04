// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_prompt_delivery_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormPromptDeliveryController on _FormPromptDeliveryBase, Store {
  final _$textErrorAtom = Atom(name: '_FormPromptDeliveryBase.textError');

  @override
  String get textError {
    _$textErrorAtom.reportRead();
    return super.textError;
  }

  @override
  set textError(String value) {
    _$textErrorAtom.reportWrite(value, super.textError, () {
      super.textError = value;
    });
  }

  final _$textSuccessAtom = Atom(name: '_FormPromptDeliveryBase.textSuccess');

  @override
  String get textSuccess {
    _$textSuccessAtom.reportRead();
    return super.textSuccess;
  }

  @override
  set textSuccess(String value) {
    _$textSuccessAtom.reportWrite(value, super.textSuccess, () {
      super.textSuccess = value;
    });
  }

  final _$controllerTitleAtom =
      Atom(name: '_FormPromptDeliveryBase.controllerTitle');

  @override
  TextEditingController get controllerTitle {
    _$controllerTitleAtom.reportRead();
    return super.controllerTitle;
  }

  @override
  set controllerTitle(TextEditingController value) {
    _$controllerTitleAtom.reportWrite(value, super.controllerTitle, () {
      super.controllerTitle = value;
    });
  }

  final _$createdPromptDeliveryAsyncAction =
      AsyncAction('_FormPromptDeliveryBase.createdPromptDelivery');

  @override
  Future createdPromptDelivery() {
    return _$createdPromptDeliveryAsyncAction
        .run(() => super.createdPromptDelivery());
  }

  @override
  String toString() {
    return '''
textError: ${textError},
textSuccess: ${textSuccess},
controllerTitle: ${controllerTitle}
    ''';
  }
}
