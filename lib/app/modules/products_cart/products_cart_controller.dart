import 'package:eliana_app/app/app_controller.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/models/product_order.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'products_cart_controller.g.dart';

class ProductsCartController = _ProductsCartBase with _$ProductsCartController;

abstract class _ProductsCartBase with Store {
  AppController appController = Modular.get();

  @observable
  ObservableList<Product> products = <Product>[].asObservable();

  @action
  Future getProducts() async {
    products = appController.products;
  }

  @action
  decrementAmount(int index, {int multiplier = 1}) {
    if (appController.productsOrder[index].amount - multiplier * 1 < 0) return;
    appController.productsOrder[index].amount -= multiplier * 1;
    List<ProductOrder> newList = appController.productsOrder;
    appController.productsOrder = newList;
  }

  @action
  incrementAmount(int index, {int multiplier = 1}) {
    appController.productsOrder[index].amount += multiplier * 1;
    List<ProductOrder> newList = appController.productsOrder;
    appController.productsOrder = newList;
  }
}
