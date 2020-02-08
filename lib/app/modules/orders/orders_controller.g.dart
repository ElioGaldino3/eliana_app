// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrdersController on _OrdersBase, Store {
  Computed<int> _$totalComputed;

  @override
  int get total => (_$totalComputed ??= Computed<int>(() => super.total)).value;

  final _$_OrdersBaseActionController = ActionController(name: '_OrdersBase');

  @override
  dynamic getOrders() {
    final _$actionInfo = _$_OrdersBaseActionController.startAction();
    try {
      return super.getOrders();
    } finally {
      _$_OrdersBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteOrder(int id) {
    final _$actionInfo = _$_OrdersBaseActionController.startAction();
    try {
      return super.deleteOrder(id);
    } finally {
      _$_OrdersBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deliveredOrder(int id) {
    final _$actionInfo = _$_OrdersBaseActionController.startAction();
    try {
      return super.deliveredOrder(id);
    } finally {
      _$_OrdersBaseActionController.endAction(_$actionInfo);
    }
  }
}
