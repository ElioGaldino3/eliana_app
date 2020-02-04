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
  @action
  Future<bool> loginWithGoogle() async {
    try {
      loading = true;
      await auth.loginWithGoogle();
      User user = await _database.getUser(auth.user.uid);
      if (user == null) {
        auth.userDB = await _database.newUser(auth.user.uid);
        user = auth.userDB;
      } else if (user.isUser) {
        Modular.to.pushReplacementNamed('/orders/');
      } else {
        tryAcess = true;
      }
    } catch (e) {
      loading = false;
    }
  }
}
