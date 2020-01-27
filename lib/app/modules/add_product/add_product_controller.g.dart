// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddProductController on _AddProductBase, Store {
  final _$textNameControllerAtom =
      Atom(name: '_AddProductBase.textNameController');

  @override
  TextEditingController get textNameController {
    _$textNameControllerAtom.context
        .enforceReadPolicy(_$textNameControllerAtom);
    _$textNameControllerAtom.reportObserved();
    return super.textNameController;
  }

  @override
  set textNameController(TextEditingController value) {
    _$textNameControllerAtom.context.conditionallyRunInAction(() {
      super.textNameController = value;
      _$textNameControllerAtom.reportChanged();
    }, _$textNameControllerAtom, name: '${_$textNameControllerAtom.name}_set');
  }

  final _$textValueControllerAtom =
      Atom(name: '_AddProductBase.textValueController');

  @override
  TextEditingController get textValueController {
    _$textValueControllerAtom.context
        .enforceReadPolicy(_$textValueControllerAtom);
    _$textValueControllerAtom.reportObserved();
    return super.textValueController;
  }

  @override
  set textValueController(TextEditingController value) {
    _$textValueControllerAtom.context.conditionallyRunInAction(() {
      super.textValueController = value;
      _$textValueControllerAtom.reportChanged();
    }, _$textValueControllerAtom,
        name: '${_$textValueControllerAtom.name}_set');
  }
}
