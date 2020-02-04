// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppBase, Store {
  final _$userLoginAtom = Atom(name: '_AppBase.userLogin');

  @override
  bool get userLogin {
    _$userLoginAtom.context.enforceReadPolicy(_$userLoginAtom);
    _$userLoginAtom.reportObserved();
    return super.userLogin;
  }

  @override
  set userLogin(bool value) {
    _$userLoginAtom.context.conditionallyRunInAction(() {
      super.userLogin = value;
      _$userLoginAtom.reportChanged();
    }, _$userLoginAtom, name: '${_$userLoginAtom.name}_set');
  }

  final _$productsOrderAtom = Atom(name: '_AppBase.productsOrder');

  @override
  List<ProductOrder> get productsOrder {
    _$productsOrderAtom.context.enforceReadPolicy(_$productsOrderAtom);
    _$productsOrderAtom.reportObserved();
    return super.productsOrder;
  }

  @override
  set productsOrder(List<ProductOrder> value) {
    _$productsOrderAtom.context.conditionallyRunInAction(() {
      super.productsOrder = value;
      _$productsOrderAtom.reportChanged();
    }, _$productsOrderAtom, name: '${_$productsOrderAtom.name}_set');
  }
}
