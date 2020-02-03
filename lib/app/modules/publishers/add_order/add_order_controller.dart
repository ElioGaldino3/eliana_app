import 'package:eliana_app/app/modules/clients/clients_controller.dart';
import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/models/order.dart';
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
  Order order = Order(dataDelivery: DateTime.now());

  @action
  getClients() async {
    clients = await _hasura.getClients();
    dropDownMenuItems = buildDropdownMenuItems(clients);
    selectedClient = dropDownMenuItems[0].value;
    if (order.id != null) {
      changeOption(order.client.id);
    }
  }

  @action
  changeBagulho() {
    selectedClient =
        Client(id: 1, name: "Veiii", phone: "12312311", photoUrl: "asdas.jpg");
  }

  @action
  changeOption(int id) {
    selectedClient = dropDownMenuItems[
            dropDownMenuItems.indexWhere((client) => client.value.id == id)]
        .value;
  }
}
