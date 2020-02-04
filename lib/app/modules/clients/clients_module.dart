import 'package:eliana_app/app/modules/clients/clients_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eliana_app/app/modules/clients/clients_page.dart';

class ClientsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClientsController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ClientsPage()),
      ];

  static Inject get to => Inject<ClientsModule>.of();
}
