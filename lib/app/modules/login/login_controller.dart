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
  bool loading = false;

  @observable
  bool tryAcess = false;

  @observable
  bool haveAcess = false;
  @action
  Future loginWithGoogle() async {
    try {
      loading = true;
      await auth.loginWithGoogle();
      User user = await _database.getUser(auth.user.uid);
      if (user == null) {
        user = await _database.newUser(auth.user.uid);
        auth.userDB = user;
      } else if (user.isUser) {
        haveAcess = true;
        auth.status = AuthStatus.login;
      } else {
        tryAcess = true;
        loading = false;
      }
    } catch (e) {
      loading = false;
    }
  }
}
