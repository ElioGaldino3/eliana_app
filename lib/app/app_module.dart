import 'package:eliana_app/app/app_controller.dart';
import 'package:eliana_app/app/modules/clients/clients_module.dart';
import 'package:eliana_app/app/modules/products/products_module.dart';
import 'package:eliana_app/app/modules/publishers/add_client/add_client_module.dart';
import 'package:eliana_app/app/modules/rents/rents_controller.dart';
import 'package:eliana_app/app/shared/repositories/database/database_hasura.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:eliana_app/app/app_widget.dart';
import 'modules/orders/orders_module.dart';
import 'modules/rents/rents_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => RentsController()),
        Bind((i) => DataBaseHasura()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: OrdersModule()),
        Router('/rents/', module: RentsModule()),
        Router('/products/', module: ProductsModule()),
        Router('/clients/', module: ClientsModule()),
        Router('/add-client/', module: AddClientModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
