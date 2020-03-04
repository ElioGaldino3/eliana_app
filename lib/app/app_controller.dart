import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/models/product_order.dart';
import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'shared/models/client.dart';
import 'shared/models/product_rent.dart';

part 'app_controller.g.dart';

class AppController = _AppBase with _$AppController;

abstract class _AppBase with Store {
  IDatabase _database = Modular.get();

  @observable
  bool userLogin = false;

  @observable
  List<ProductOrder> productsOrder = [];

  @observable
  List<ProductRent> productsRent = [];

  @observable
  ObservableStream<List<Client>> clientsStream;
  @computed
  ObservableList<Client> get clients => clientsStream?.value?.asObservable();
  @computed
  int get totalClients => clients.length;

  @observable
  ObservableStream<List<Product>> productsStream;
  @computed
  ObservableList<Product> get products =>
      productsStream?.value?.asObservable();
  @computed
  int get totalProducts => products.length;

  _AppBase() {
    clientsStream = _database.getStreamClients().asObservable();
    productsStream = _database.getStreamProducts().asObservable();
  }

  @computed
  String get actualRouter => Modular.actualRoute;
}
