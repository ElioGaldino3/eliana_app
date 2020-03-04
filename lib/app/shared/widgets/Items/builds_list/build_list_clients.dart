import 'package:eliana_app/app/modules/clients/clients_controller.dart';
import 'package:eliana_app/app/shared/models/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mobx/mobx.dart';

import '../../alert_dialog_yes_no.dart';
import '../item_client.dart';

class BuildListClients extends StatelessWidget {
  final ObservableList<Client> clients;

  const BuildListClients({Key key, this.clients})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
        child: ListView.builder(
      itemCount: clients.length,
      itemBuilder: (BuildContext context, int index) {
        return AnimationConfiguration.staggeredList(
            position: index,
            child: ScaleAnimation(
              child: Container(
                child: Dismissible(
                    direction: DismissDirection.startToEnd,
                    key: ValueKey(clients[index].id),
                    child: ClientItem(clients[index]),
                    confirmDismiss: (_) async {
                      await showDialog(
                          context: context,
                          builder: (_) => AlertDialogYesNo(
                                title: "Deletar Cliente",
                                content:
                                    "Você realmente quer deletar o(a) ${clients[index].name}?",
                                yesFunction: () {
                                  Modular.get<ClientsController>().deleteClient(clients[index].id);
                                },
                              ),
                          barrierDismissible: false);
                    }),
                padding: EdgeInsets.only(bottom: 4),
              ),
            ));
      },
    ));
  }
}
