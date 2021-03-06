import 'package:eliana_app/app/app_controller.dart';
import 'package:eliana_app/app/modules/publishers/add_client/add_client_controller.dart';
import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/widgets/Items/builds_list/build_list_clients.dart';
import 'package:eliana_app/app/shared/widgets/custom_drawer/custom_drawer_widget.dart';
import 'package:eliana_app/app/shared/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';

import 'clients_controller.dart';

class ClientsPage extends StatefulWidget {
  @override
  _ClientsPageState createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  ClientsController controller = Modular.get();
  AppController appController = Modular.get();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Modular.to.pushReplacementNamed('/rents-orders');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Clientes"),
        ),
        body: Observer(
          builder: (context) {
            if (appController.clientsStream.status == StreamStatus.waiting)
              return Center(child: LoadingAnimation());
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: BuildListClients(
                    clients: appController.clients,
                  ),
                ),
                Container(
                  height: 90,
                  color: Colors.purple[800],
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 23.0),
                        child: Text(
                          "${appController.totalClients} clientes",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )),
                  ),
                )
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(FontAwesomeIcons.plus),
          onPressed: () {
            Modular.to.pushNamed("/add-client/");
            AddClientController addController = Modular.get();
            addController.client = Client();
          },
        ),
        drawer: CustomDrawerWidget(),
      ),
    );
  }
}
