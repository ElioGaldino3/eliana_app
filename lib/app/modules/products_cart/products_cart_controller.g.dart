// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductsCartController on _ProductsCartBase, Store {
  final _$productsAtom = Atom(name: '_ProductsCartBase.products');

  @override
  List<Product> get products {
    _$productsAtom.context.enforceReadPolicy(_$productsAtom);
    _$productsAtom.reportObserved();
    return super.products;
  }

  @override
  set products(List<Product> value) {
    _$productsAtom.context.conditionallyRunInAction(() {
      super.products = value;
      _$productsAtom.reportChanged();
    }, _$productsAtom, name: '${_$productsAtom.name}_set');
  }

  final _$getProductsAsyncAction = AsyncAction('getProducts');

  @override
  Future getProducts() {
    return _$getProductsAsyncAction.run(() => super.getProducts());
  }
}
