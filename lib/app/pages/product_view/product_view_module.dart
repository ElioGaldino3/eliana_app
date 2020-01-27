import 'package:eliana_app/app/pages/product_view/product_view_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eliana_app/app/pages/product_view/product_view_page.dart';

class ProductViewModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProductViewController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ProductViewPage()),
      ];

  static Inject get to => Inject<ProductViewModule>.of();
}
