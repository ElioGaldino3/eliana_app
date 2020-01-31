import 'package:eliana_app/app/modules/home/home_module.dart';
import 'package:eliana_app/app/shared/utils/app_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'clients_controller.g.dart';

class ClientsController = _ClientsBase with _$ClientsController;

abstract class _ClientsBase with Store {
  AppRepository repo = Inject<HomeModule>.of().get();

  @observable
  ObservableStream clients;

  @computed
  int get totalClients => clients.data['data']['clients'].length;

  _ClientsBase() {
    clients = repo.getClients();
  }
}
