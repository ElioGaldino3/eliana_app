import 'package:eliana_app/app/modules/home/home_module.dart';
import 'package:eliana_app/app/shared/utils/app_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'rents_controller.g.dart';

class RentsController = _RentsBase with _$RentsController;

abstract class _RentsBase with Store {
    AppRepository repo = Inject<HomeModule>.of().get();

  @observable
  ObservableStream rents;

  @computed
  int get totalRents => rents.data['data']['rents'].length;

  _RentsBase() {
    rents = repo.getRents();
  }
}
