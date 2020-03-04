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

  @observable
  Rent rent = Rent(dateRent: DateTime.now(), productRents: []);

  @computed
  double get total {
    double totalCart = 0.0;
    if (rent.productRents == null || rent.productRents == []) return 0.0;
    if (products == null) return 0.0;
    for (ProductRent productRent in rent.productRents) {
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
    adressController.text = rent.adress;
    commentController.text = rent.comment;
    if (rent.id != null) {
      changeOption(rent.client.id);
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
    rent.client = selectedClient;
    rent.productRents = appController.productsRent;
    rent.adress = adressController.text;
    rent.comment = commentController.text;
    if (rent.id != null) {
      bool isDeleted = await _hasura.deleteRent(rent.id);
      print(isDeleted);
      if (isDeleted) {
        Rent newRent = await _hasura.putRent(rent);
        rent = newRent;
      }
    } else {
      Rent newRent = await _hasura.putRent(rent);
      rent = newRent;
    }
    isPut = false;
  }
}
