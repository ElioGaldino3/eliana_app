import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'rents_orders_controller.g.dart';

class RentsOrdersController = _RentsOrdersBase with _$RentsOrdersController;

abstract class _RentsOrdersBase with Store {
  IDatabase _hasura = Modular.get();

  @observable
  ObservableStream<List<Order>> orders;
  @observable
  ObservableStream<List<Rent>> rents;

  _RentsOrdersBase() {
    getStreamOrders();
  }

  @action
  getStreamOrders() {
    orders = _hasura.getStreamOrders().asObservable();
    rents = _hasura.getStreamRents().asObservable();
  }

  @computed
  ObservableList<CustomListItem> get customList {
    ObservableList<CustomListItem> listItems =
        <CustomListItem>[].asObservable();
    if (orders.value != null) {
      orders.value.forEach((order) {
        listItems.add(CustomListItem(order: order, isOrder: true));
      });
    }

    if (rents.value != null) {
      rents.value.forEach((rent) {
        listItems.add(CustomListItem(rent: rent, isOrder: false));
      });
    }

    return listItems;
  }

  @computed
  int get total => customList.length ?? 0;

  @action
  delete(CustomListItem item) {
    if (item.isOrder)
      _hasura.deleteOrder(item.order.id);
    else
      _hasura.deleteRent(item.rent.id);
  }

  @action
  delivered(CustomListItem item) {
    if (item.isOrder)
      _hasura.deliveredOrder(Order(id: item.order.id));
    else
      _hasura.deliveredRent(Rent(id: item.rent.id));
  }
}

class CustomListItem {
  final bool isOrder;
  final Order order;
  final Rent rent;

  CustomListItem({this.order, this.rent, this.isOrder = false});
}
