import 'package:eliana_app/app/app_controller.dart';
import 'package:eliana_app/app/modules/clients/clients_controller.dart';
import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/models/product_order.dart';
import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:eliana_app/app/shared/utils/build_dropdown_clients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttie/fluttie.dart';
import 'package:mobx/mobx.dart';

part 'add_order_controller.g.dart';

class AddOrderController = _AddOrderBase with _$AddOrderController;

abstract class _AddOrderBase with Store {
  IDatabase _hasura = Modular.get();
  AppController appController = Modular.get();

  ClientsController clientsControlller;

  @observable
  List<Client> clients = List<Client>();

  @observable
  Client selectedClient = Client();

  @observable
  TextEditingController commentController = TextEditingController();

  @observable
  List<DropdownMenuItem<Client>> dropDownMenuItems;

  @observable
  List<Product> products = List<Product>();

  @observable
  Order order = Order(dataDelivery: DateTime.now(), productOrders: []);

  @observable
  var instance = Fluttie();

  @observable
  var animation;

  @observable
  var compositor;

  _AddOrderBase() {
    prepareAnimation();
  }

  @action 
  prepareAnimation() async {
    compositor = await instance.loadAnimationFromAsset(
      "animations/eliana_loading.json", //Replace this string with your actual file
    );
    animation = instance.prepareAnimation(compositor);
  }

  @computed
  double get total {
    double totalCart = 0.0;
    if (order.productOrders == null) return 0.0;
    if (products.isEmpty) return 0.0;
    for (ProductOrder productOrder in order.productOrders) {
      Product product = products[products
          .indexWhere((product) => product.id == productOrder.idProduct)];
      totalCart += product.value * productOrder.amount;
    }
    return totalCart;
  }

  @action
  Future getClients() async {
    clients = await _hasura.getClients();
    products = await _hasura.getProducts();
    dropDownMenuItems = buildDropdownMenuItems(clients);
    selectedClient = dropDownMenuItems[0].value;
    commentController.text = order.comment;
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
    order.client = selectedClient;
    order.productOrders = appController.productsOrder;
    order.comment = commentController.text;
    if (order.id != null) {
      if (await _hasura.deleteOrder(order.id)) {
        Order newOrder = await _hasura.putOrder(order);
        order = newOrder;
      }
    } else {
      Order newOrder = await _hasura.putOrder(order);
      order = newOrder;
    }
  }
}
