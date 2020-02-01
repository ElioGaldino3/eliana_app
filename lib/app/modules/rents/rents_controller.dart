import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'rents_controller.g.dart';

class RentsController = _RentsBase with _$RentsController;

abstract class _RentsBase with Store {
  IDatabase _hasura = Modular.get();

  @observable
  ObservableStream rents;

  _RentsBase() {
    rents = _hasura.getRents();
  }

  @action
  deleteRent(int id) {
    _hasura.deleteRent(id);
  }
}
