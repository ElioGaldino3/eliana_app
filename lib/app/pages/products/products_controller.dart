import 'package:eliana_app/app/modules/home/home_module.dart';
import 'package:eliana_app/app/shared/utils/app_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'products_controller.g.dart';

class ProductsController = _ProductsBase with _$ProductsController;

abstract class _ProductsBase with Store {
  AppRepository repo = Inject<HomeModule>.of().get();

  @observable
  ObservableStream products;

  @computed
  int get totalProducts => products.data['data']['products'].length;

  _ProductsBase() {
    products = repo.getProducts();
  }
}
