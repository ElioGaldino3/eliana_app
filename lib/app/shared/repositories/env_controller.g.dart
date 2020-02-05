// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EnvController on _EnvControllerBase, Store {
  final _$envAtom = Atom(name: '_EnvControllerBase.env');

  @override
  dynamic get env {
    _$envAtom.context.enforceReadPolicy(_$envAtom);
    _$envAtom.reportObserved();
    return super.env;
  }

  @override
  set env(dynamic value) {
    _$envAtom.context.conditionallyRunInAction(() {
      super.env = value;
      _$envAtom.reportChanged();
    }, _$envAtom, name: '${_$envAtom.name}_set');
  }

  final _$_EnvControllerBaseActionController =
      ActionController(name: '_EnvControllerBase');

  @override
  dynamic setEnv(String value) {
    final _$actionInfo = _$_EnvControllerBaseActionController.startAction();
    try {
      return super.setEnv(value);
    } finally {
      _$_EnvControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
