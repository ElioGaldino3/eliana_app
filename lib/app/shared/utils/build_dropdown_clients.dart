import 'package:eliana_app/app/shared/models/client.dart';
import 'package:flutter/material.dart';

List<DropdownMenuItem<Client>> buildDropdownMenuItems(
    List clients) {
  List<DropdownMenuItem<Client>> items = List();
  for (Client client in clients) {
    items.add(
      DropdownMenuItem(
        value: client,
        child: Text(client.name),
      ),
    );
  }
  return items;
}

onChangeDropdownItem(Client selectedClient){

}
