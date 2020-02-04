// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_rent_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddRentController on _AddRentBase, Store {
  Computed<double> _$totalComputed;

  @override
  double get total =>
      (_$totalComputed ??= Computed<double>(() => super.total)).value;

  final _$clientsAtom = Atom(name: '_AddRentBase.clients');

  @override
  List<Client> get clients {
    _$clientsAtom.context.enforceReadPolicy(_$clientsAtom);
    _$clientsAtom.reportObserved();
    return super.clients;
  }

  @override
  set clients(List<Client> value) {
    _$clientsAtom.context.conditionallyRunInAction(() {
      super.clients = value;
      _$clientsAtom.reportChanged();
    }, _$clientsAtom, name: '${_$clientsAtom.name}_set');
  }

  final _$selectedClientAtom = Atom(name: '_AddRentBase.selectedClient');

  @override
  Client get selectedClient {
    _$selectedClientAtom.context.enforceReadPolicy(_$selectedClientAtom);
    _$selectedClientAtom.reportObserved();
    return super.selectedClient;
  }

  @override
  set selectedClient(Client value) {
    _$selectedClientAtom.context.conditionallyRunInAction(() {
      super.selectedClient = value;
      _$selectedClientAtom.reportChanged();
    }, _$selectedClientAtom, name: '${_$selectedClientAtom.name}_set');
  }

  final _$dropDownMenuItemsAtom = Atom(name: '_AddRentBase.dropDownMenuItems');

  @override
  List<DropdownMenuItem<Client>> get dropDownMenuItems {
    _$dropDownMenuItemsAtom.context.enforceReadPolicy(_$dropDownMenuItemsAtom);
    _$dropDownMenuItemsAtom.reportObserved();
    return super.dropDownMenuItems;
  }

  @override
  set dropDownMenuItems(List<DropdownMenuItem<Client>> value) {
    _$dropDownMenuItemsAtom.context.conditionallyRunInAction(() {
      super.dropDownMenuItems = value;
      _$dropDownMenuItemsAtom.reportChanged();
    }, _$dropDownMenuItemsAtom, name: '${_$dropDownMenuItemsAtom.name}_set');
  }

  final _$productsAtom = Atom(name: '_AddRentBase.products');

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

  final _$rentAtom = Atom(name: '_AddRentBase.rent');

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

  final _$getClientsAsyncAction = AsyncAction('getClients');

  @override
  Future<dynamic> getClients() {
    return _$getClientsAsyncAction.run(() => super.getClients());
  }

  final _$putRentAsyncAction = AsyncAction('putRent');

  @override
  Future putRent() {
    return _$putRentAsyncAction.run(() => super.putRent());
  }

  final _$_AddRentBaseActionController = ActionController(name: '_AddRentBase');

  @override
  dynamic changeOption(int id) {
    final _$actionInfo = _$_AddRentBaseActionController.startAction();
    try {
      return super.changeOption(id);
    } finally {
      _$_AddRentBaseActionController.endAction(_$actionInfo);
    }
  }
}
