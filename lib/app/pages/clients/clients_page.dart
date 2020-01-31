import 'package:eliana_app/app/app_module.dart';
import 'package:eliana_app/app/modules/home/home_controller.dart';
import 'package:eliana_app/app/modules/home/home_module.dart';
import 'package:eliana_app/app/pages/add_client/add_client_controller.dart';
import 'package:eliana_app/app/pages/add_client/add_client_page.dart';
import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/widgets/item_client.dart';
import 'package:eliana_app/app/shared/widgets/title_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'clients_controller.dart';

class ClientsPage extends StatefulWidget {
  final String title;
  const ClientsPage({Key key, this.title = "Clients"}) : super(key: key);

  @override
  _ClientsPageState createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  ClientsController controller = Inject<AppModule>.of().get();
  HomeController controllerApp = Inject<HomeModule>.of().get();
  AddClientController addClientController = Inject<AppModule>.of().get();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TitlePage(title: "Clientes"),
        Expanded(
          child: Observer(
            builder: (_) {
              if (controller.clients.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                            controller.clients.data['data']['clients'].length,
                        itemBuilder: (BuildContext context, int index) {
                          Client client = Client.fromJson(controller
                              .clients.data['data']['clients'][index]);
                          return Container(
                            child: ClientItem(
                                client: client,
                                onTap: () {
                                  addClientController.client = client;
                                  controllerApp.changePage(AddClientPage());
                                }),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 90,
                      padding: EdgeInsets.only(right: 15),
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Observer(
                            builder: (_) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 13.0),
                                child: Text(
                                  '${controller.totalClients.toString()} clientes',
                                  style: TextStyle(fontSize: 18),
                                ),
                              );
                            },
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: FloatingActionButton(
                                onPressed: () {
                                  controllerApp.changePage(AddClientPage());
                                },
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }
            },
          ),
        )
      ],
    );
  }
}
