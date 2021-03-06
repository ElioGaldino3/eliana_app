import 'package:eliana_app/app/shared/models/client.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

ObservableList<DropdownMenuItem<Client>> buildDropdownMenuItems(
    ObservableList clients) {
  ObservableList<DropdownMenuItem<Client>> items = ObservableList();
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
