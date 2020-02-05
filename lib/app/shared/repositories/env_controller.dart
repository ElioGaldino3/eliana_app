import 'package:mobx/mobx.dart';
part 'env_controller.g.dart';

class EnvController = _EnvControllerBase with _$EnvController;

abstract class _EnvControllerBase with Store {
  @observable
  var env;

  @action
  setEnv(String value) {
    env = value;
  }
}
