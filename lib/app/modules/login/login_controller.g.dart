// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginBase, Store {
  final _$tryAcessAtom = Atom(name: '_LoginBase.tryAcess');

  @override
  bool get tryAcess {
    _$tryAcessAtom.context.enforceReadPolicy(_$tryAcessAtom);
    _$tryAcessAtom.reportObserved();
    return super.tryAcess;
  }

  @override
  set tryAcess(bool value) {
    _$tryAcessAtom.context.conditionallyRunInAction(() {
      super.tryAcess = value;
      _$tryAcessAtom.reportChanged();
    }, _$tryAcessAtom, name: '${_$tryAcessAtom.name}_set');
  }

  final _$haveAcessAtom = Atom(name: '_LoginBase.haveAcess');

  @override
  bool get haveAcess {
    _$haveAcessAtom.context.enforceReadPolicy(_$haveAcessAtom);
    _$haveAcessAtom.reportObserved();
    return super.haveAcess;
  }

  @override
  set haveAcess(bool value) {
    _$haveAcessAtom.context.conditionallyRunInAction(() {
      super.haveAcess = value;
      _$haveAcessAtom.reportChanged();
    }, _$haveAcessAtom, name: '${_$haveAcessAtom.name}_set');
  }

  final _$userAtom = Atom(name: '_LoginBase.user');

  @override
  User get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_LoginBase.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$loginWithGoogleAsyncAction = AsyncAction('loginWithGoogle');

  @override
  Future<dynamic> loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
  }

  final _$_LoginBaseActionController = ActionController(name: '_LoginBase');

  @override
  dynamic initController() {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.initController();
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic powerLoading() {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.powerLoading();
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }
}
