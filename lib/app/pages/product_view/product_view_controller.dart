import 'package:mobx/mobx.dart';

part 'product_view_controller.g.dart';

class ProductViewController = _ProductViewBase with _$ProductViewController;

abstract class _ProductViewBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
