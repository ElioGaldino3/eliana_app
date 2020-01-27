import 'package:eliana_app/app/pages/home_view/home_view_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eliana_app/app/pages/home_view/home_view_page.dart';

class HomeViewModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeViewController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomeViewPage()),
      ];

  static Inject get to => Inject<HomeViewModule>.of();
}
