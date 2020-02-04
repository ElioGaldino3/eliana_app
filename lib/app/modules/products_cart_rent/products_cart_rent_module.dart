import 'package:eliana_app/app/modules/products_cart_rent/products_cart_rent_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eliana_app/app/modules/products_cart_rent/products_cart_rent_page.dart';

class ProductsCartRentModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProductsCartRentController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ProductsCartRentPage()),
      ];

  static Inject get to => Inject<ProductsCartRentModule>.of();
}
