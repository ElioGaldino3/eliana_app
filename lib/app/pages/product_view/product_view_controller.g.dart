// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_view_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductViewController on _ProductViewBase, Store {
  final _$totalProductsAtom = Atom(name: '_ProductViewBase.totalProducts');

  @override
  int get totalProducts {
    _$totalProductsAtom.context.enforceReadPolicy(_$totalProductsAtom);
    _$totalProductsAtom.reportObserved();
    return super.totalProducts;
  }

  @override
  set totalProducts(int value) {
    _$totalProductsAtom.context.conditionallyRunInAction(() {
      super.totalProducts = value;
      _$totalProductsAtom.reportChanged();
    }, _$totalProductsAtom, name: '${_$totalProductsAtom.name}_set');
  }

  final _$_ProductViewBaseActionController =
      ActionController(name: '_ProductViewBase');

  @override
  void changeTotal(int total) {
    final _$actionInfo = _$_ProductViewBaseActionController.startAction();
    try {
      return super.changeTotal(total);
    } finally {
      _$_ProductViewBaseActionController.endAction(_$actionInfo);
    }
  }
}
