// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientsController on _ClientsBase, Store {
  Computed<int> _$totalClientsComputed;

  @override
  int get totalClients =>
      (_$totalClientsComputed ??= Computed<int>(() => super.totalClients))
          .value;

  final _$clientsAtom = Atom(name: '_ClientsBase.clients');

  @override
  ObservableStream<dynamic> get clients {
    _$clientsAtom.context.enforceReadPolicy(_$clientsAtom);
    _$clientsAtom.reportObserved();
    return super.clients;
  }

  @override
  set clients(ObservableStream<dynamic> value) {
    _$clientsAtom.context.conditionallyRunInAction(() {
      super.clients = value;
      _$clientsAtom.reportChanged();
    }, _$clientsAtom, name: '${_$clientsAtom.name}_set');
  }
}