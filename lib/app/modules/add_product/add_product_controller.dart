import 'package:mobx/mobx.dart';

part 'add_product_controller.g.dart';

class AddProductController = _AddProductBase with _$AddProductController;

abstract class _AddProductBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
