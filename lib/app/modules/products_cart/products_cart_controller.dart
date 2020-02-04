import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/repositories/database/database_hasura.dart';
import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'products_cart_controller.g.dart';

class ProductsCartController = _ProductsCartBase with _$ProductsCartController;

abstract class _ProductsCartBase with Store {
  IDatabase _hasura = Modular.get();

  @observable
  List<Product> products = [];

  _ProductsCartBase() {
    getProducts();
  }

  @action
  getProducts() async {
    products = await _hasura.getProducts();
  }
}
