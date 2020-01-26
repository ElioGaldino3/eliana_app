// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$selectedIndexAtom = Atom(name: '_HomeBase.selectedIndex');

  @override
  int get selectedIndex {
    _$selectedIndexAtom.context.enforceReadPolicy(_$selectedIndexAtom);
    _$selectedIndexAtom.reportObserved();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.context.conditionallyRunInAction(() {
      super.selectedIndex = value;
      _$selectedIndexAtom.reportChanged();
    }, _$selectedIndexAtom, name: '${_$selectedIndexAtom.name}_set');
  }

  final _$controllerPageAtom = Atom(name: '_HomeBase.controllerPage');

  @override
  PageController get controllerPage {
    _$controllerPageAtom.context.enforceReadPolicy(_$controllerPageAtom);
    _$controllerPageAtom.reportObserved();
    return super.controllerPage;
  }

  @override
  set controllerPage(PageController value) {
    _$controllerPageAtom.context.conditionallyRunInAction(() {
      super.controllerPage = value;
      _$controllerPageAtom.reportChanged();
    }, _$controllerPageAtom, name: '${_$controllerPageAtom.name}_set');
  }

  final _$_HomeBaseActionController = ActionController(name: '_HomeBase');

  @override
  dynamic changeIndexes(int index) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.changeIndexes(index);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }
}
