import 'package:eliana_app/app/modules/publishers/add_client/add_client_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eliana_app/app/modules/publishers/add_client/add_client_page.dart';

class AddClientModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AddClientController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AddClientPage(), transition: TransitionType.fadeIn),
      ];

  static Inject get to => Inject<AddClientModule>.of();
}
