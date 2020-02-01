import 'package:eliana_app/app/modules/products/products_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eliana_app/app/modules/products/products_page.dart';

class ProductsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProductsController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ProductsPage(), transition: TransitionType.fadeIn),
      ];

  static Inject get to => Inject<ProductsModule>.of();
}
