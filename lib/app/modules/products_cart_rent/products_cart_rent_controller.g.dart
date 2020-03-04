// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_cart_rent_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductsCartRentController on _ProductsCartRentBase, Store {
  final _$productsAtom = Atom(name: '_ProductsCartRentBase.products');

  @override
  ObservableList<Product> get products {
    _$productsAtom.context.enforceReadPolicy(_$productsAtom);
    _$productsAtom.reportObserved();
    return super.products;
  }

  @override
  set products(ObservableList<Product> value) {
    _$productsAtom.context.conditionallyRunInAction(() {
      super.products = value;
      _$productsAtom.reportChanged();
    }, _$productsAtom, name: '${_$productsAtom.name}_set');
  }

  final _$getProductsAsyncAction = AsyncAction('getProducts');

  @override
  Future<dynamic> getProducts() {
    return _$getProductsAsyncAction.run(() => super.getProducts());
  }

  final _$_ProductsCartRentBaseActionController =
      ActionController(name: '_ProductsCartRentBase');

  @override
  dynamic decrementAmount(int index, {int multiplier = 1}) {
    final _$actionInfo = _$_ProductsCartRentBaseActionController.startAction();
    try {
      return super.decrementAmount(index, multiplier: multiplier);
    } finally {
      _$_ProductsCartRentBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic incrementAmount(int index, {int multiplier = 1}) {
    final _$actionInfo = _$_ProductsCartRentBaseActionController.startAction();
    try {
      return super.incrementAmount(index, multiplier: multiplier);
    } finally {
      _$_ProductsCartRentBaseActionController.endAction(_$actionInfo);
    }
  }
}
