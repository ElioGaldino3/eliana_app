import 'package:eliana_app/app/pages/add_client/add_client_controller.dart';
import 'package:eliana_app/app/pages/rents/rents_controller.dart';
import 'package:eliana_app/app/pages/clients/clients_controller.dart';
import 'package:eliana_app/app/pages/orders/orders_controller.dart';
import 'package:eliana_app/app/pages/products/products_controller.dart';
import 'package:eliana_app/app/pages/init/init_controller.dart';
import 'package:eliana_app/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:eliana_app/app/app_widget.dart';
import 'package:eliana_app/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AddClientController()),
        Bind((i) => RentsController()),
        Bind((i) => ClientsController()),
        Bind((i) => OrdersController()),
        Bind((i) => ProductsController()),
        Bind((i) => InitController()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
