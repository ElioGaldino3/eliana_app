import 'package:mobx/mobx.dart';

part 'home_page_app_controller.g.dart';

class HomePageAppController = _HomePageAppBase with _$HomePageAppController;

abstract class _HomePageAppBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
