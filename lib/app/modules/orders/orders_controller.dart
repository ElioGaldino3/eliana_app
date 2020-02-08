import 'package:eliana_app/app/modules/calendar/calendar_controller.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'orders_controller.g.dart';

class OrdersController = _OrdersBase with _$OrdersController;

abstract class _OrdersBase with Store {
  IDatabase _hasura = Modular.get();
  CalendarPageController calendarController = Modular.get();

  @computed
  int get total => calendarController.orders.status == StreamStatus.waiting
      ? 0
      : calendarController.orders.data['data']['orders'].length;

  @action
  getOrders() {}

  @action
  deleteOrder(int id) {
    _hasura.deleteOrder(id);
  }

  @action
  deliveredOrder(int id) {
    _hasura.deliveredOrder(Order(id: id));
  }
}
