import 'package:eliana_app/app/modules/add_product/add_product_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eliana_app/app/modules/add_product/add_product_page.dart';

class AddProductModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AddProductController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AddProductPage()),
      ];

  static Inject get to => Inject<AddProductModule>.of();
}
