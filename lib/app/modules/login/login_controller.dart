import 'package:eliana_app/app/shared/models/user.dart';
import 'package:eliana_app/app/shared/repositories/auth_controller.dart';
import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  AuthController auth = Modular.get();
  IDatabase _database = Modular.get();

  @observable
  bool tryAcess = false;

  @observable
  bool haveAcess = false;

  @observable
  User user;

  @observable
  bool loading = false;

  _LoginBase() {
    initController();
  }

  @action
  initController() {
    if (auth.userDB != null) {
      if (auth.userDB.isUser && auth.status == AuthStatus.login)
        Modular.to.pushReplacementNamed('/orders/');
      else if (!auth.userDB.isUser && auth.status == AuthStatus.login)
        tryAcess = true;
    }
  }

  @action
  Future loginWithGoogle() async {
    try {
      await auth.loginWithGoogle();
      user = await _database.getUser(auth.user.uid);
      if (user == null) {
        user = await _database.newUser(auth.user.uid);
        auth.userDB = user;
        tryAcess = true;
      } else if (user.isUser) {
        Modular.to.pushReplacementNamed('/rents-orders');
        auth.status = AuthStatus.haveAcess;
      } else {
        tryAcess = true;
      }
    } catch (e) {
      print(e);
    }
  }

  @action
  powerLoading() {
    loading = true;
  }
}
