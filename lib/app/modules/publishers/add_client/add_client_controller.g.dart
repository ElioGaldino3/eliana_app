// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_client_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddClientController on _AddClientBase, Store {
  Computed<String> _$nameTextComputed;

  @override
  String get nameText =>
      (_$nameTextComputed ??= Computed<String>(() => super.nameText)).value;

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

  final _$nameControllerAtom = Atom(name: '_AddClientBase.nameController');

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.context.enforceReadPolicy(_$nameControllerAtom);
    _$nameControllerAtom.reportObserved();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.context.conditionallyRunInAction(() {
      super.nameController = value;
      _$nameControllerAtom.reportChanged();
    }, _$nameControllerAtom, name: '${_$nameControllerAtom.name}_set');
  }

  final _$phoneControllerAtom = Atom(name: '_AddClientBase.phoneController');

  @override
  TextEditingController get phoneController {
    _$phoneControllerAtom.context.enforceReadPolicy(_$phoneControllerAtom);
    _$phoneControllerAtom.reportObserved();
    return super.phoneController;
  }

  @override
  set phoneController(TextEditingController value) {
    _$phoneControllerAtom.context.conditionallyRunInAction(() {
      super.phoneController = value;
      _$phoneControllerAtom.reportChanged();
    }, _$phoneControllerAtom, name: '${_$phoneControllerAtom.name}_set');
  }
}
