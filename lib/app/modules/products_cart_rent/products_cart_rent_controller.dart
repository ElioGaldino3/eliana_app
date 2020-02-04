import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/models/product_rent.dart';
import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../app_controller.dart';

part 'products_cart_rent_controller.g.dart';

class ProductsCartRentController = _ProductsCartRentBase
    with _$ProductsCartRentController;

abstract class _ProductsCartRentBase with Store {
  IDatabase _hasura = Modular.get();
  AppController appController = Modular.get();

  @observable
  List<Product> products = [];

  @action
  Future getProducts() async {
    products = await _hasura.getProducts();
  }

  @action
  decrementAmount(int index, {int multiplier = 1}) {
    if (appController.productsRent[index].amount - multiplier * 1 < 0) return;
    appController.productsRent[index].amount -= multiplier * 1;
    List<ProductRent> newList = appController.productsRent;
    appController.productsRent = newList;
  }

  @action
  incrementAmount(int index, {int multiplier = 1}) {
    appController.productsRent[index].amount += multiplier * 1;
    List<ProductRent> newList = appController.productsRent;
    appController.productsRent = newList;
  }
  
}
