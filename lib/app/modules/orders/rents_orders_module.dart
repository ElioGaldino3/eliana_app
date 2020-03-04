
import 'package:flutter_modular/flutter_modular.dart';
import 'rents_orders_controller.dart';
import 'rents_orders_page.dart';

class RentsOrdersModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RentsOrdersController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => RentsOrdersPage()),
      ];

  static Inject get to => Inject<RentsOrdersModule>.of();
}
