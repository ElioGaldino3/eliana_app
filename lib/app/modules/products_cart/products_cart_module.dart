import 'package:eliana_app/app/modules/products_cart/products_cart_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eliana_app/app/modules/products_cart/products_cart_page.dart';

class ProductsCartModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProductsCartController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ProductsCartPage(), transition: TransitionType.fadeIn),
      ];

  static Inject get to => Inject<ProductsCartModule>.of();
}
