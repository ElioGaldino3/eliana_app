import 'package:eliana_app/app/modules/rents/rents_controller.dart';
import 'package:eliana_app/app/modules/rents/rents_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RentsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RentsController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => RentsPage()),
      ];

  static Inject get to => Inject<RentsModule>.of();
}
