import 'package:eliana_app/app/modules/clients/clients_controller.dart';
import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/models/product_order.dart';
import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:eliana_app/app/shared/utils/build_dropdown_clients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'add_order_controller.g.dart';

class AddOrderController = _AddOrderBase with _$AddOrderController;

abstract class _AddOrderBase with Store {
  IDatabase _hasura = Modular.get();

  ClientsController clientsControlller;

  _AddOrderBase() {
    getClients();
  }

  @observable
  List<Client> clients = List<Client>();

  @observable
  Client selectedClient = Client();

  @observable
  List<DropdownMenuItem<Client>> dropDownMenuItems;

  @observable
  List<Product> products = List<Product>();

  @observable
  Order order = Order(dataDelivery: DateTime.now());

  @computed
  double get total {
    print("querendo total");
    double totalCart = 0.0;
    if (order.productOrders == null) return 0.0;
    for (ProductOrder productOrder in order.productOrders) {
      Product product = products[products.indexWhere((product) => product.id == productOrder.idProduct)];
      totalCart += product.value * productOrder.amount;
    }
    return totalCart;
  }

  @action
  getClients() async {
    clients = await _hasura.getClients();
    products = await _hasura.getProducts();
    dropDownMenuItems = buildDropdownMenuItems(clients);
    selectedClient = dropDownMenuItems[0].value;
    if (order.id != null) {
      changeOption(order.client.id);
    }
  }

  @action
  changeOption(int id) {
    selectedClient = dropDownMenuItems[
            dropDownMenuItems.indexWhere((client) => client.value.id == id)]
        .value;
  }

  @action
  putOrder() async {
    order.productOrders = [];
    order.client = selectedClient;
    order.productOrders.add(ProductOrder(idProduct: 1, amount: 5));
    order.productOrders.add(ProductOrder(idProduct: 2, amount: 6));
    order.productOrders.add(ProductOrder(idProduct: 3, amount: 2));
    Order newOrder = await _hasura.putOrder(order);
    order = newOrder;
  }
}
