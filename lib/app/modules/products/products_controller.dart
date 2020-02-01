import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'products_controller.g.dart';

class ProductsController = _ProductsBase with _$ProductsController;

abstract class _ProductsBase with Store {
  IDatabase _hasura = Modular.get();

  @observable
  ObservableStream products;

  _ProductsBase() {
    products = _hasura.getProducts();
  }

  @action
  deleteProduct(int id) {
    _hasura.deleteProduct(id);
  }
}
