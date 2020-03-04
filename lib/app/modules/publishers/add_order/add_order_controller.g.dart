// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_order_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddOrderController on _AddOrderBase, Store {
  Computed<double> _$totalComputed;

  @override
  double get total =>
      (_$totalComputed ??= Computed<double>(() => super.total)).value;

  final _$clientsAtom = Atom(name: '_AddOrderBase.clients');

  @override
  ObservableList<Client> get clients {
    _$clientsAtom.context.enforceReadPolicy(_$clientsAtom);
    _$clientsAtom.reportObserved();
    return super.clients;
  }

  @override
  set clients(ObservableList<Client> value) {
    _$clientsAtom.context.conditionallyRunInAction(() {
      super.clients = value;
      _$clientsAtom.reportChanged();
    }, _$clientsAtom, name: '${_$clientsAtom.name}_set');
  }

  final _$selectedClientAtom = Atom(name: '_AddOrderBase.selectedClient');

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

  final _$isPutAtom = Atom(name: '_AddOrderBase.isPut');

  @override
  bool get isPut {
    _$isPutAtom.context.enforceReadPolicy(_$isPutAtom);
    _$isPutAtom.reportObserved();
    return super.isPut;
  }

  @override
  set isPut(bool value) {
    _$isPutAtom.context.conditionallyRunInAction(() {
      super.isPut = value;
      _$isPutAtom.reportChanged();
    }, _$isPutAtom, name: '${_$isPutAtom.name}_set');
  }

  final _$commentControllerAtom = Atom(name: '_AddOrderBase.commentController');

  @override
  TextEditingController get commentController {
    _$commentControllerAtom.context.enforceReadPolicy(_$commentControllerAtom);
    _$commentControllerAtom.reportObserved();
    return super.commentController;
  }

  @override
  set commentController(TextEditingController value) {
    _$commentControllerAtom.context.conditionallyRunInAction(() {
      super.commentController = value;
      _$commentControllerAtom.reportChanged();
    }, _$commentControllerAtom, name: '${_$commentControllerAtom.name}_set');
  }

  final _$dropDownMenuItemsAtom = Atom(name: '_AddOrderBase.dropDownMenuItems');

  @override
  ObservableList<DropdownMenuItem<Client>> get dropDownMenuItems {
    _$dropDownMenuItemsAtom.context.enforceReadPolicy(_$dropDownMenuItemsAtom);
    _$dropDownMenuItemsAtom.reportObserved();
    return super.dropDownMenuItems;
  }

  @override
  set dropDownMenuItems(ObservableList<DropdownMenuItem<Client>> value) {
    _$dropDownMenuItemsAtom.context.conditionallyRunInAction(() {
      super.dropDownMenuItems = value;
      _$dropDownMenuItemsAtom.reportChanged();
    }, _$dropDownMenuItemsAtom, name: '${_$dropDownMenuItemsAtom.name}_set');
  }

  final _$productsAtom = Atom(name: '_AddOrderBase.products');

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

  final _$instanceAtom = Atom(name: '_AddOrderBase.instance');

  @override
  Fluttie get instance {
    _$instanceAtom.context.enforceReadPolicy(_$instanceAtom);
    _$instanceAtom.reportObserved();
    return super.instance;
  }

  @override
  set instance(Fluttie value) {
    _$instanceAtom.context.conditionallyRunInAction(() {
      super.instance = value;
      _$instanceAtom.reportChanged();
    }, _$instanceAtom, name: '${_$instanceAtom.name}_set');
  }

  final _$animationAtom = Atom(name: '_AddOrderBase.animation');

  @override
  dynamic get animation {
    _$animationAtom.context.enforceReadPolicy(_$animationAtom);
    _$animationAtom.reportObserved();
    return super.animation;
  }

  @override
  set animation(dynamic value) {
    _$animationAtom.context.conditionallyRunInAction(() {
      super.animation = value;
      _$animationAtom.reportChanged();
    }, _$animationAtom, name: '${_$animationAtom.name}_set');
  }

  final _$compositorAtom = Atom(name: '_AddOrderBase.compositor');

  @override
  dynamic get compositor {
    _$compositorAtom.context.enforceReadPolicy(_$compositorAtom);
    _$compositorAtom.reportObserved();
    return super.compositor;
  }

  @override
  set compositor(dynamic value) {
    _$compositorAtom.context.conditionallyRunInAction(() {
      super.compositor = value;
      _$compositorAtom.reportChanged();
    }, _$compositorAtom, name: '${_$compositorAtom.name}_set');
  }

  final _$prepareAnimationAsyncAction = AsyncAction('prepareAnimation');

  @override
  Future prepareAnimation() {
    return _$prepareAnimationAsyncAction.run(() => super.prepareAnimation());
  }

  final _$getClientsAsyncAction = AsyncAction('getClients');

  @override
  Future<dynamic> getClients() {
    return _$getClientsAsyncAction.run(() => super.getClients());
  }

  final _$putOrderAsyncAction = AsyncAction('putOrder');

  @override
  Future putOrder() {
    return _$putOrderAsyncAction.run(() => super.putOrder());
  }

  final _$_AddOrderBaseActionController =
      ActionController(name: '_AddOrderBase');

  @override
  dynamic changeOption(int id) {
    final _$actionInfo = _$_AddOrderBaseActionController.startAction();
    try {
      return super.changeOption(id);
    } finally {
      _$_AddOrderBaseActionController.endAction(_$actionInfo);
    }
  }
}
