import 'package:eliana_app/app/modules/clients/clients_controller.dart';
import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/models/product_rent.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:eliana_app/app/shared/utils/build_dropdown_clients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../app_controller.dart';

part 'add_rent_controller.g.dart';

class AddRentController = _AddRentBase with _$AddRentController;

abstract class _AddRentBase with Store {
  IDatabase _hasura = Modular.get();
  AppController appController = Modular.get();

  ClientsController clientsControlller;

  @observable
  ObservableList<Client> clients;

  @observable
  TextEditingController adressController = TextEditingController();

  @observable
  TextEditingController commentController = TextEditingController();

  @observable
  Client selectedClient = Client();

  @observable
  List<DropdownMenuItem<Client>> dropDownMenuItems;

  @observable
  ObservableList<Product> products;

  @observable
  bool isPut = false;

  @computed
  double get total {
    double totalCart = 0.0;
    if (appController.rent.productRents == null || appController.rent.productRents == []) return 0.0;
    if (products == null) return 0.0;
    for (ProductRent productRent in appController.rent.productRents) {
      if (productRent.productId != null) {
        Product product = products[products
            .indexWhere((product) => product.id == productRent.productId)];
        totalCart += product.value * productRent.amount;
      }
    }
    return totalCart;
  }

  _AddRentBase() {
    getClients();
  }
  Future getClients() async {
    clients = appController.clients;
    products = appController.products;
    dropDownMenuItems = buildDropdownMenuItems(clients);
    selectedClient = dropDownMenuItems[0].value;
    adressController.text = appController.rent.adress;
    commentController.text = appController.rent.comment;
    if (appController.rent.client != null) {
      changeOption(appController.rent.client.id);
    }
  }

  @action
  changeOption(int id) {
    selectedClient = dropDownMenuItems[
            dropDownMenuItems.indexWhere((client) => client.value.id == id)]
        .value;
  }

  @action
  putRent() async {
    isPut = true;
    appController.rent.client = selectedClient;
    appController.rent.productRents = appController.productsRent;
    appController.rent.adress = adressController.text;
    appController.rent.comment = commentController.text;
    if (appController.rent.id != null) {
      bool isDeleted = await _hasura.deleteRent(appController.rent.id);
      print(isDeleted);
      if (isDeleted) {
        Rent newRent = await _hasura.putRent(appController.rent);
        appController.rent = newRent;
      }
    } else {
      Rent newRent = await _hasura.putRent(appController.rent);
      appController.rent = newRent;
    }
    isPut = false;
  }
}
