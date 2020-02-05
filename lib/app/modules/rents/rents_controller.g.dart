// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rents_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RentsController on _RentsBase, Store {
  Computed<int> _$totalComputed;

  @override
  int get total => (_$totalComputed ??= Computed<int>(() => super.total)).value;

  final _$rentsAtom = Atom(name: '_RentsBase.rents');

  @override
  ObservableStream<dynamic> get rents {
    _$rentsAtom.context.enforceReadPolicy(_$rentsAtom);
    _$rentsAtom.reportObserved();
    return super.rents;
  }

  @override
  set rents(ObservableStream<dynamic> value) {
    _$rentsAtom.context.conditionallyRunInAction(() {
      super.rents = value;
      _$rentsAtom.reportChanged();
    }, _$rentsAtom, name: '${_$rentsAtom.name}_set');
  }

  final _$_RentsBaseActionController = ActionController(name: '_RentsBase');

  @override
  dynamic getRents() {
    final _$actionInfo = _$_RentsBaseActionController.startAction();
    try {
      return super.getRents();
    } finally {
      _$_RentsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteRent(int id) {
    final _$actionInfo = _$_RentsBaseActionController.startAction();
    try {
      return super.deleteRent(id);
    } finally {
      _$_RentsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deliveredRent(int id) {
    final _$actionInfo = _$_RentsBaseActionController.startAction();
    try {
      return super.deliveredRent(id);
    } finally {
      _$_RentsBaseActionController.endAction(_$actionInfo);
    }
  }
}
