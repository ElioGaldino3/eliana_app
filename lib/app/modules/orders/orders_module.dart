
import 'package:flutter_modular/flutter_modular.dart';
import 'orders_controller.dart';
import 'orders_page.dart';

class OrdersModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => OrdersController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => OrdersPage()),
      ];

  static Inject get to => Inject<OrdersModule>.of();
}
