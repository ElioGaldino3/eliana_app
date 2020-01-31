// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$currentPageAtom = Atom(name: '_HomeBase.currentPage');

  @override
  Widget get currentPage {
    _$currentPageAtom.context.enforceReadPolicy(_$currentPageAtom);
    _$currentPageAtom.reportObserved();
    return super.currentPage;
  }

  @override
  set currentPage(Widget value) {
    _$currentPageAtom.context.conditionallyRunInAction(() {
      super.currentPage = value;
      _$currentPageAtom.reportChanged();
    }, _$currentPageAtom, name: '${_$currentPageAtom.name}_set');
  }

  final _$_HomeBaseActionController = ActionController(name: '_HomeBase');

  @override
  dynamic changePage(Widget page) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.changePage(page);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }
}
