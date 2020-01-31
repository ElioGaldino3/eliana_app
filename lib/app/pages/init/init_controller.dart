import 'package:eliana_app/app/modules/home/home_module.dart';
import 'package:eliana_app/app/shared/utils/app_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'init_controller.g.dart';

class InitController = _InitBase with _$InitController;

abstract class _InitBase with Store {
  
  AppRepository repo = Inject<HomeModule>.of().get();

  @observable
  ObservableStream orders;

  _InitBase() {
    orders = repo.getOrders();
  }

}
