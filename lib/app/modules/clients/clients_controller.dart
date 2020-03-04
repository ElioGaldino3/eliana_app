import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'clients_controller.g.dart';

class ClientsController = _ClientsBase with _$ClientsController;

abstract class _ClientsBase with Store {
  IDatabase _hasura = Modular.get();
  
  @action
  deleteClient(int id) {
    _hasura.deleteClient(id);
  }
}
