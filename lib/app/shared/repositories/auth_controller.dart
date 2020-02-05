import 'package:eliana_app/app/shared/models/user.dart';
import 'package:eliana_app/app/shared/repositories/auth/auth_repository_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'database/database_interface.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuth _authRepository = Modular.get();
  IDatabase _hasura = Modular.get();

  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  FirebaseUser user;

  User userDB;

  @action
  setUser(FirebaseUser value) async {
    user = value;

    if (user == null) {
      status = AuthStatus.logoff;
    } else {
      userDB = await _hasura.getUser(user.uid);
      if (userDB != null) {
        if (userDB.isUser) {
          status = AuthStatus.haveAcess;
        } else {
          status = AuthStatus.login;
        }
      } else {
        userDB = await _hasura.newUser(user.uid);
        status = AuthStatus.login;
      }
    }
  }

  _AuthControllerBase() {
    _authRepository.getUser().then(setUser);
  }

  @action
  loginWithGoogle() async {
    user = await _authRepository.getGoogleLogin();
  }

  @action
  Future logOut() {
    _authRepository.getLogout();
  }

  @action
  logout() async {
    await logOut();
  }
}

enum AuthStatus { loading, login, logoff, haveAcess }
