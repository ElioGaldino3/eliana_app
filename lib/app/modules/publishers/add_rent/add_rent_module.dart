import 'package:eliana_app/app/modules/publishers/add_rent/add_rent_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eliana_app/app/modules/publishers/add_rent/add_rent_page.dart';

class AddRentModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AddRentController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AddRentPage()),
      ];

  static Inject get to => Inject<AddRentModule>.of();
}
