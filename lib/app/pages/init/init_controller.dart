import 'package:mobx/mobx.dart';

part 'init_controller.g.dart';

class InitController = _InitBase with _$InitController;

abstract class _InitBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
