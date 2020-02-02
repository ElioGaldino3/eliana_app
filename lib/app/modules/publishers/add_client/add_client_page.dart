import 'package:cached_network_image/cached_network_image.dart';
import 'package:eliana_app/app/modules/publishers/add_client/add_client_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddClientPage extends StatefulWidget {
  @override
  _AddClientPageState createState() => _AddClientPageState();
}

class _AddClientPageState extends State<AddClientPage> {
  AddClientController controller = Modular.get();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.client.id != null
            ? "Editar Cliente"
            : "Adicionar Cliente"),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.redoAlt, size: 18,),
            onPressed: () {},
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(25),
              children: <Widget>[
                TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    border: OutlineInputBorder(),
                  ),
                  validator: (_) {
                    if (controller.nameText.isEmpty) {
                      print(controller.nameText.isEmpty);
                      return "Coloque o nome do cliente por favor";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: controller.phoneController,
                  decoration: InputDecoration(
                    labelText: "Telefone",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 15),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: controller.client.photoUrl.isEmpty
                              ? AssetImage('images/icon-client.png')
                              : CachedNetworkImageProvider(
                                  controller.client.photoUrl))),
                ),
                Center(
                  child: Text(controller.client.photoUrl.isEmpty
                      ? "Aperte para adicionar uma foto"
                      : "Aperte para alterar a foto"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
