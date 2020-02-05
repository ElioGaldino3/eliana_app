import 'package:eliana_app/app/shared/models/order.dart';
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
    getOrders();
  }

  @computed
  int get total => orders.status == StreamStatus.waiting ? 0 : orders.data['data']['orders'].length;

  @action
  getOrders() {
    orders = _hasura.getStreamOrders();
  }

  @action
  deleteOrder(int id) {
    _hasura.deleteOrder(id);
  }

  @action
  deliveredOrder(int id) {
    _hasura.deliveredOrder(Order(id: id));
  }
}
