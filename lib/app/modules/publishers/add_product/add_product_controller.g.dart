// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddProductController on _AddProductBase, Store {
  Computed<String> _$nameTextComputed;

  @override
  String get nameText =>
      (_$nameTextComputed ??= Computed<String>(() => super.nameText)).value;

  final _$productAtom = Atom(name: '_AddProductBase.product');

  @override
  Product get product {
    _$productAtom.context.enforceReadPolicy(_$productAtom);
    _$productAtom.reportObserved();
    return super.product;
  }

  @override
  set product(Product value) {
    _$productAtom.context.conditionallyRunInAction(() {
      super.product = value;
      _$productAtom.reportChanged();
    }, _$productAtom, name: '${_$productAtom.name}_set');
  }

  final _$nameControllerAtom = Atom(name: '_AddProductBase.nameController');

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.context.enforceReadPolicy(_$nameControllerAtom);
    _$nameControllerAtom.reportObserved();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.context.conditionallyRunInAction(() {
      super.nameController = value;
      _$nameControllerAtom.reportChanged();
    }, _$nameControllerAtom, name: '${_$nameControllerAtom.name}_set');
  }

  final _$valueControllerAtom = Atom(name: '_AddProductBase.valueController');

  @override
  TextEditingController get valueController {
    _$valueControllerAtom.context.enforceReadPolicy(_$valueControllerAtom);
    _$valueControllerAtom.reportObserved();
    return super.valueController;
  }

  @override
  set valueController(TextEditingController value) {
    _$valueControllerAtom.context.conditionallyRunInAction(() {
      super.valueController = value;
      _$valueControllerAtom.reportChanged();
    }, _$valueControllerAtom, name: '${_$valueControllerAtom.name}_set');
  }

  final _$uploadImageAsyncAction = AsyncAction('uploadImage');

  @override
  Future uploadImage(File image) {
    return _$uploadImageAsyncAction.run(() => super.uploadImage(image));
  }

  final _$addProductAsyncAction = AsyncAction('addProduct');

  @override
  Future addProduct() {
    return _$addProductAsyncAction.run(() => super.addProduct());
  }

  final _$_AddProductBaseActionController =
      ActionController(name: '_AddProductBase');

  @override
  dynamic changeOptionRent(bool isRent) {
    final _$actionInfo = _$_AddProductBaseActionController.startAction();
    try {
      return super.changeOptionRent(isRent);
    } finally {
      _$_AddProductBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reset() {
    final _$actionInfo = _$_AddProductBaseActionController.startAction();
    try {
      return super.reset();
    } finally {
      _$_AddProductBaseActionController.endAction(_$actionInfo);
    }
  }
}
