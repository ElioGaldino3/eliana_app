import 'dart:io';

import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'add_client_controller.g.dart';

class AddClientController = _AddClientBase with _$AddClientController;

abstract class _AddClientBase with Store {
  IDatabase _hasura = Modular.get();

  @observable
  Client client = Client();

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  TextEditingController phoneController = TextEditingController();

  @computed
  String get nameText => nameController.text;

  @action
  uploadImage(File image) async {
    String urlPhoto = await _hasura.uploadImage(image, client.id, "clients");
    Client newClient = client;
    newClient.photoUrl = urlPhoto;
    client = newClient;
    _hasura.updateClient(newClient);
  }

  @action
  addClient() async {
    if (client.id != null) {
      Client newClient = Client(
          id: client.id,
          name: nameController.text,
          phone: phoneController.text,
          photoUrl: client.photoUrl);
      client = newClient;
      _hasura.updateClient(newClient);
    } else {
      client.name = nameController.text;
      client.phone = phoneController.text;
      Client newClient = await _hasura.putClient(client);
      client = newClient;
    }
  }
}
