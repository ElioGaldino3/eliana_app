import 'package:eliana_app/app/shared/models/product_order.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppBase with _$AppController;

abstract class _AppBase with Store {
  @observable
  bool userLogin = false;

  @observable
  List<ProductOrder> productsOrder = [];
}
