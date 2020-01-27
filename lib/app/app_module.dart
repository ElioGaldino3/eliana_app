import 'package:eliana_app/app/app_repository.dart';
import 'package:eliana_app/app/app_controller.dart';
import 'package:eliana_app/app/modules/add_product/add_product_page.dart';
import 'package:eliana_app/app/pages/product_view/product_view_controller.dart';
import 'package:eliana_app/app/pages/product_view/product_view_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:eliana_app/app/app_widget.dart';
import 'package:eliana_app/app/modules/home/home_module.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'modules/add_product/add_product_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => AppRepository(Inject<AppModule>.of().get())),
        Bind((i) => HasuraConnect('http://192.168.42.212:8080/v1/graphql')),
        Bind((i) => ProductViewController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
        Router('/add-product/', module: AddProductModule()),
        Router('/add-product/:id',
            child: (_, args) =>
                AddProductPage(id: int.parse(args.params['id'])))
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
