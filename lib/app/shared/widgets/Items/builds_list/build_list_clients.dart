import 'package:eliana_app/app/modules/clients/clients_controller.dart';
import 'package:eliana_app/app/shared/models/client.dart';
import 'package:flutter/material.dart';
import '../../alert_dialog_yes_no.dart';
import '../item_client.dart';

class BuildListClients extends StatelessWidget {
  final List listStream;
  final ClientsController controller;

  const BuildListClients({Key key, this.listStream, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listStream.length,
      itemBuilder: (BuildContext context, int index) {
        var list = Client.fromJson(listStream[index]);
        return Container(
          child: Dismissible(
              key: ValueKey(list.id),
              child: ClientItem(list),
              confirmDismiss: (_) async {
                await showDialog(
                    context: context,
                    builder: (_) => AlertDialogYesNo(
                          title: "Deletar Cliente",
                          content:
                              "Você realmente quer deletar o(a) ${list.name}?",
                          yesFunction: () {
                            print('deletando o cliente com id: ${list.id}');
                            controller.deleteClient(list.id);
                          },
                        ),
                    barrierDismissible: false);
              }),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        );
      },
    );
  }
}
