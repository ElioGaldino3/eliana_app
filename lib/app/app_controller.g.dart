// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppBase, Store {
  Computed<ObservableList<Client>> _$clientsComputed;

  @override
  ObservableList<Client> get clients => (_$clientsComputed ??=
          Computed<ObservableList<Client>>(() => super.clients))
      .value;
  Computed<int> _$totalClientsComputed;

  @override
  int get totalClients =>
      (_$totalClientsComputed ??= Computed<int>(() => super.totalClients))
          .value;
  Computed<ObservableList<Product>> _$productsComputed;

  @override
  ObservableList<Product> get products => (_$productsComputed ??=
          Computed<ObservableList<Product>>(() => super.products))
      .value;
  Computed<int> _$totalProductsComputed;

  @override
  int get totalProducts =>
      (_$totalProductsComputed ??= Computed<int>(() => super.totalProducts))
          .value;
  Computed<String> _$actualRouterComputed;

  @override
  String get actualRouter =>
      (_$actualRouterComputed ??= Computed<String>(() => super.actualRouter))
          .value;

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

  final _$orderAtom = Atom(name: '_AppBase.order');

  @override
  Order get order {
    _$orderAtom.context.enforceReadPolicy(_$orderAtom);
    _$orderAtom.reportObserved();
    return super.order;
  }

  @override
  set order(Order value) {
    _$orderAtom.context.conditionallyRunInAction(() {
      super.order = value;
      _$orderAtom.reportChanged();
    }, _$orderAtom, name: '${_$orderAtom.name}_set');
  }

  final _$rentAtom = Atom(name: '_AppBase.rent');

  @override
  Rent get rent {
    _$rentAtom.context.enforceReadPolicy(_$rentAtom);
    _$rentAtom.reportObserved();
    return super.rent;
  }

  @override
  set rent(Rent value) {
    _$rentAtom.context.conditionallyRunInAction(() {
      super.rent = value;
      _$rentAtom.reportChanged();
    }, _$rentAtom, name: '${_$rentAtom.name}_set');
  }

  final _$productsRentAtom = Atom(name: '_AppBase.productsRent');

  @override
  List<ProductRent> get productsRent {
    _$productsRentAtom.context.enforceReadPolicy(_$productsRentAtom);
    _$productsRentAtom.reportObserved();
    return super.productsRent;
  }

  @override
  set productsRent(List<ProductRent> value) {
    _$productsRentAtom.context.conditionallyRunInAction(() {
      super.productsRent = value;
      _$productsRentAtom.reportChanged();
    }, _$productsRentAtom, name: '${_$productsRentAtom.name}_set');
  }

  final _$clientsStreamAtom = Atom(name: '_AppBase.clientsStream');

  @override
  ObservableStream<List<Client>> get clientsStream {
    _$clientsStreamAtom.context.enforceReadPolicy(_$clientsStreamAtom);
    _$clientsStreamAtom.reportObserved();
    return super.clientsStream;
  }

  @override
  set clientsStream(ObservableStream<List<Client>> value) {
    _$clientsStreamAtom.context.conditionallyRunInAction(() {
      super.clientsStream = value;
      _$clientsStreamAtom.reportChanged();
    }, _$clientsStreamAtom, name: '${_$clientsStreamAtom.name}_set');
  }

  final _$productsStreamAtom = Atom(name: '_AppBase.productsStream');

  @override
  ObservableStream<List<Product>> get productsStream {
    _$productsStreamAtom.context.enforceReadPolicy(_$productsStreamAtom);
    _$productsStreamAtom.reportObserved();
    return super.productsStream;
  }

  @override
  set productsStream(ObservableStream<List<Product>> value) {
    _$productsStreamAtom.context.conditionallyRunInAction(() {
      super.productsStream = value;
      _$productsStreamAtom.reportChanged();
    }, _$productsStreamAtom, name: '${_$productsStreamAtom.name}_set');
  }
}
