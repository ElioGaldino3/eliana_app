import 'package:eliana_app/app/modules/home/home_controller.dart';
import 'package:eliana_app/app/shared/utils/app_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eliana_app/app/modules/home/home_page.dart';
import 'package:hasura_connect/hasura_connect.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => AppRepository(i.get<HasuraConnect>())),
        Bind((i) => HasuraConnect("http://192.168.42.212:8080/v1/graphql")),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
