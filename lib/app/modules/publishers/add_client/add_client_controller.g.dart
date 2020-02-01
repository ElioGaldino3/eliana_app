// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_client_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddClientController on _AddClientBase, Store {
  final _$clientAtom = Atom(name: '_AddClientBase.client');

  @override
  Client get client {
    _$clientAtom.context.enforceReadPolicy(_$clientAtom);
    _$clientAtom.reportObserved();
    return super.client;
  }

  @override
  set client(Client value) {
    _$clientAtom.context.conditionallyRunInAction(() {
      super.client = value;
      _$clientAtom.reportChanged();
    }, _$clientAtom, name: '${_$clientAtom.name}_set');
  }
}
