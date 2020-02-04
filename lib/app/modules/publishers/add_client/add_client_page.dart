import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eliana_app/app/modules/publishers/add_client/add_client_controller.dart';
import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/widgets/image_source_sheet.dart';
import 'package:eliana_app/app/shared/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_extend/share_extend.dart';

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
            icon: Icon(
              FontAwesomeIcons.redoAlt,
              size: 18,
            ),
            onPressed: () {
              controller.nameController.clear();
              controller.phoneController.clear();
              controller.client = Client(phone: "", photoUrl: "");
            },
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
                  textCapitalization: TextCapitalization.words,
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
                GestureDetector(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 230,
                      width: 230,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: controller.client.photoUrl.isEmpty
                              ? AssetImage('images/icon-client.png')
                              : CachedNetworkImageProvider(
                                  controller.client.photoUrl),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    if (controller.client.id == null) {
                      ShowToast.showCustomToast(FontAwesomeIcons.camera,
                          "Salve o cliente primeiro", context, Colors.red[400]);
                      return;
                    }
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => ImageSourceSheet(
                              onImageSelected: (File file) {
                                if (file != null) {
                                  controller.uploadImage(file);
                                }
                              },
                            ));
                  },
                ),
                SizedBox(height: 10),
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
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.save),
        onPressed: () {
          if (controller.nameController.text.isEmpty) {
            ShowToast.showCustomToast(FontAwesomeIcons.user,
                "Coloque o nome do cliente", context, Colors.red[400]);
            return;
          }
          bool isNew;
          if (controller.client.id != null)
            isNew = false;
          else
            isNew = true;
          FocusScope.of(context).requestFocus(FocusNode());
          controller.addClient();
          isNew
              ? ShowToast.showCustomToast(
                  FontAwesomeIcons.solidCheckCircle,
                  "${controller.client.name} adicionado(a)",
                  context,
                  Colors.green[400])
              : ShowToast.showCustomToast(
                  FontAwesomeIcons.solidCheckCircle,
                  "${controller.client.name} editado(a)",
                  context,
                  Colors.green[400]);
        },
      ),
    );
  }
}
