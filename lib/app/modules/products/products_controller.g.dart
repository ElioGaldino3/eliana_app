// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductsController on _ProductsBase, Store {
  Computed<int> _$totalComputed;

  @override
  int get total => (_$totalComputed ??= Computed<int>(() => super.total)).value;

  final _$productsAtom = Atom(name: '_ProductsBase.products');

  @override
  ObservableStream<dynamic> get products {
    _$productsAtom.context.enforceReadPolicy(_$productsAtom);
    _$productsAtom.reportObserved();
    return super.products;
  }

  @override
  set products(ObservableStream<dynamic> value) {
    _$productsAtom.context.conditionallyRunInAction(() {
      super.products = value;
      _$productsAtom.reportChanged();
    }, _$productsAtom, name: '${_$productsAtom.name}_set');
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
