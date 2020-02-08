import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'rents_controller.g.dart';

class RentsController = _RentsBase with _$RentsController;

abstract class _RentsBase with Store {
  IDatabase _hasura = Modular.get();

  _RentsBase() {
    getStream();
  }

  @observable
  ObservableStream rents;

  @computed
  int get total => rents.data == null
      ? 0
      : rents.data['data']['rents'].length;

  @action
  getStream() {
    rents = _hasura.getStreamRents();
  }

  @action
  deleteRent(int id) {
    _hasura.deleteRent(id);
  }

  @action
  deliveredRent(int id) {
    _hasura.deliveredRent(Rent(id: id));
  }
}
