import 'package:eliana_app/app/shared/models/client.dart';
import 'package:mobx/mobx.dart';

part 'add_client_controller.g.dart';

class AddClientController = _AddClientBase with _$AddClientController;

abstract class _AddClientBase with Store {
  @observable
  Client client = Client();
}
