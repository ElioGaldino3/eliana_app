import 'package:eliana_app/app/modules/home/home_module.dart';
import 'package:eliana_app/app/shared/utils/app_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'orders_controller.g.dart';

class OrdersController = _OrdersBase with _$OrdersController;

abstract class _OrdersBase with Store {
  AppRepository repo = Inject<HomeModule>.of().get();

  @observable
  ObservableStream orders;

  @computed
  int get totalOrders => orders.data['data']['orders'].length;

  _OrdersBase() {
    orders = repo.getOrders();
  }
}
