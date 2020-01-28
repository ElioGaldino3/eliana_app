import 'package:mobx/mobx.dart';

part 'edit_product_controller.g.dart';

class EditProductController = _EditProductBase with _$EditProductController;

abstract class _EditProductBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
