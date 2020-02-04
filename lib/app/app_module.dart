import 'package:eliana_app/app/app_controller.dart';
import 'package:eliana_app/app/modules/clients/clients_module.dart';
import 'package:eliana_app/app/modules/products/products_module.dart';
import 'package:eliana_app/app/modules/publishers/add_client/add_client_module.dart';
import 'package:eliana_app/app/modules/rents/rents_controller.dart';
import 'package:eliana_app/app/shared/repositories/auth/auth_repository.dart';
import 'package:eliana_app/app/shared/repositories/auth_controller.dart';
import 'package:eliana_app/app/shared/repositories/database/database_hasura.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:eliana_app/app/app_widget.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'modules/login/login_module.dart';
import 'modules/orders/orders_module.dart';
import 'modules/products_cart/products_cart_module.dart';
import 'modules/products_cart_rent/products_cart_rent_module.dart';
import 'modules/publishers/add_order/add_order_module.dart';
import 'modules/publishers/add_product/add_product_module.dart';
import 'modules/publishers/add_rent/add_rent_module.dart';
import 'modules/rents/rents_module.dart';
import 'shared/repositories/auth/auth_repository_interface.dart';
import 'splash/splash_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => RentsController()),
        Bind((i) => DataBaseHasura(i.get<HasuraConnect>())),
        Bind((i) => HasuraConnect('http://192.168.42.212:8080/v1/graphql')),
        Bind<IAuth>((i) => AuthRepository()),
        Bind((i) => AuthController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
        Router('/login', module: LoginModule()),
        Router('/orders', module: OrdersModule()),
        Router('/rents/', module: RentsModule()),
        Router('/products/', module: ProductsModule()),
        Router('/clients/', module: ClientsModule()),
        Router('/add-client/', module: AddClientModule()),
        Router('/add-product/', module: AddProductModule()),
        Router('/add-order/', module: AddOrderModule()),
        Router('/add-rent/', module: AddRentModule()),
        Router('/add-product-list/', module: ProductsCartModule()),
        Router('/add-product-list-rent/', module: ProductsCartRentModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
