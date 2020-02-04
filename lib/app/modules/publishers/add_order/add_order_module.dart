import 'package:eliana_app/app/modules/publishers/add_order/add_order_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eliana_app/app/modules/publishers/add_order/add_order_page.dart';

class AddOrderModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AddOrderController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AddOrderPage(), transition: TransitionType.fadeIn),
      ];

  static Inject get to => Inject<AddOrderModule>.of();
}
