import 'package:eliana_app/app/shared/widgets/Items/builds_list/build_list_clients.dart';
import 'package:eliana_app/app/shared/widgets/custom_drawer/custom_drawer_widget.dart';
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
  ClientsController controller = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produtos"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Observer(
              builder: (_) {
                if (controller.clients.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return BuildListClients(
                    listStream: controller.clients.data['data']['clients'],
                    controller: controller,
                  );
                }
              },
            ),
          ),
          Container(
            height: 90,
            color: Colors.grey[200],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.plus),
        onPressed: () {},
      ),
      drawer: CustomDrawerWidget(),
    );
  }
}
