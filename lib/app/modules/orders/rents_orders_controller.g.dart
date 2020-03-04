// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rents_orders_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RentsOrdersController on _RentsOrdersBase, Store {
  Computed<ObservableList<CustomListItem>> _$customListComputed;

  @override
  ObservableList<CustomListItem> get customList => (_$customListComputed ??=
          Computed<ObservableList<CustomListItem>>(() => super.customList))
      .value;
  Computed<int> _$totalComputed;

  @override
  int get total => (_$totalComputed ??= Computed<int>(() => super.total)).value;

  final _$ordersAtom = Atom(name: '_RentsOrdersBase.orders');

  @override
  ObservableStream<List<Order>> get orders {
    _$ordersAtom.context.enforceReadPolicy(_$ordersAtom);
    _$ordersAtom.reportObserved();
    return super.orders;
  }

  @override
  set orders(ObservableStream<List<Order>> value) {
    _$ordersAtom.context.conditionallyRunInAction(() {
      super.orders = value;
      _$ordersAtom.reportChanged();
    }, _$ordersAtom, name: '${_$ordersAtom.name}_set');
  }

  final _$rentsAtom = Atom(name: '_RentsOrdersBase.rents');

  @override
  ObservableStream<List<Rent>> get rents {
    _$rentsAtom.context.enforceReadPolicy(_$rentsAtom);
    _$rentsAtom.reportObserved();
    return super.rents;
  }

  @override
  set rents(ObservableStream<List<Rent>> value) {
    _$rentsAtom.context.conditionallyRunInAction(() {
      super.rents = value;
      _$rentsAtom.reportChanged();
    }, _$rentsAtom, name: '${_$rentsAtom.name}_set');
  }

  final _$_RentsOrdersBaseActionController =
      ActionController(name: '_RentsOrdersBase');

  @override
  dynamic getStreamOrders() {
    final _$actionInfo = _$_RentsOrdersBaseActionController.startAction();
    try {
      return super.getStreamOrders();
    } finally {
      _$_RentsOrdersBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic delete(CustomListItem item) {
    final _$actionInfo = _$_RentsOrdersBaseActionController.startAction();
    try {
      return super.delete(item);
    } finally {
      _$_RentsOrdersBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic delivered(CustomListItem item) {
    final _$actionInfo = _$_RentsOrdersBaseActionController.startAction();
    try {
      return super.delivered(item);
    } finally {
      _$_RentsOrdersBaseActionController.endAction(_$actionInfo);
    }
  }
}
