import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'orders_controller.g.dart';

class OrdersController = _OrdersBase with _$OrdersController;

abstract class _OrdersBase with Store {
  IDatabase _hasura = Modular.get();

  @observable
  ObservableStream orders;

  _OrdersBase() {
    orders = _hasura.getOrders();
  }

  @action
  deleteOrder(int id) {
    _hasura.deleteOrder(id);
  }
}
