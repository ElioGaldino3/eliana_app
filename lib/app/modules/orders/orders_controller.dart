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

  @computed
  int get total => orders.data == null ? 0 : orders.data['data']['orders'].length;

  @action
  deleteOrder(int id) {
    _hasura.deleteOrder(id);
  }
}
