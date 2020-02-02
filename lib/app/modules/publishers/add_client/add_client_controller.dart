import 'package:eliana_app/app/shared/models/client.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'add_client_controller.g.dart';

class AddClientController = _AddClientBase with _$AddClientController;

abstract class _AddClientBase with Store {
  @observable
  Client client = Client();

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  TextEditingController phoneController = TextEditingController();

  @computed
  String get nameText => nameController.text;

  _AddClientBase() {
    if (client.name != null) {
      nameController.text = client.name;
      phoneController.text = client.phone;
    }
  }
}
