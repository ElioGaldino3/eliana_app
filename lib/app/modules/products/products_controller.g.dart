// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductsController on _ProductsBase, Store {
  final _$fromOrderCartAtom = Atom(name: '_ProductsBase.fromOrderCart');

  @override
  bool get fromOrderCart {
    _$fromOrderCartAtom.context.enforceReadPolicy(_$fromOrderCartAtom);
    _$fromOrderCartAtom.reportObserved();
    return super.fromOrderCart;
  }

  @override
  set fromOrderCart(bool value) {
    _$fromOrderCartAtom.context.conditionallyRunInAction(() {
      super.fromOrderCart = value;
      _$fromOrderCartAtom.reportChanged();
    }, _$fromOrderCartAtom, name: '${_$fromOrderCartAtom.name}_set');
  }

  final _$fromRentCartAtom = Atom(name: '_ProductsBase.fromRentCart');

  @override
  bool get fromRentCart {
    _$fromRentCartAtom.context.enforceReadPolicy(_$fromRentCartAtom);
    _$fromRentCartAtom.reportObserved();
    return super.fromRentCart;
  }

  @override
  set fromRentCart(bool value) {
    _$fromRentCartAtom.context.conditionallyRunInAction(() {
      super.fromRentCart = value;
      _$fromRentCartAtom.reportChanged();
    }, _$fromRentCartAtom, name: '${_$fromRentCartAtom.name}_set');
  }

  final _$_ProductsBaseActionController =
      ActionController(name: '_ProductsBase');

  @override
  dynamic deleteProduct(int id) {
    final _$actionInfo = _$_ProductsBaseActionController.startAction();
    try {
      return super.deleteProduct(id);
    } finally {
      _$_ProductsBaseActionController.endAction(_$actionInfo);
    }
  }
}
