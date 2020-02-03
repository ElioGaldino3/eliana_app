import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eliana_app/app/shared/widgets/image_source_sheet.dart';
import 'package:eliana_app/app/shared/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'add_product_controller.dart';

class AddProductPage extends StatefulWidget {
  final String title;
  const AddProductPage({Key key, this.title = "AddProduct"}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  AddProductController controller = Modular.get();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.product.id != null
            ? "Editar Produto"
            : "Adicionar Produto"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.redoAlt,
              size: 18,
            ),
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
                      return "Coloque o nome do produto por favor";
                    }
                    return null;
                  },
                  textCapitalization: TextCapitalization.words,
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: controller.valueController,
                  decoration: InputDecoration(
                    labelText: "Value",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        controller.changeOptionRent(false);
                      },
                      child: Text("Normal"),
                      color: controller.product.isRent
                          ? Colors.grey
                          : Colors.purple[400],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        controller.changeOptionRent(true);
                      },
                      child: Text("Alugável"),
                      color: controller.product.isRent
                          ? Colors.purple[400]
                          : Colors.grey,
                    ),
                  ],
                ),
                SizedBox(height: 15),
                GestureDetector(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 220,
                      width: 220,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: controller.product.photoUrl.isEmpty
                              ? AssetImage('images/icon-product.png')
                              : CachedNetworkImageProvider(
                                  controller.product.photoUrl),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    if (controller.product.id == null) {
                      ShowToast.showCustomToast(FontAwesomeIcons.camera,
                          "Salve o produto primeiro", context, Colors.red[400]);
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
                  child: Text(controller.product.photoUrl.isEmpty
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
                "Coloque o nome do produto", context, Colors.red[400]);
            return;
          }
          bool isNew;
          if (controller.product.id != null)
            isNew = false;
          else
            isNew = true;
          FocusScope.of(context).requestFocus(FocusNode());
          controller.addClient();
          isNew
              ? ShowToast.showCustomToast(
                  FontAwesomeIcons.solidCheckCircle,
                  "${controller.product.name} adicionado(a)",
                  context,
                  Colors.green[400])
              : ShowToast.showCustomToast(
                  FontAwesomeIcons.solidCheckCircle,
                  "${controller.product.name} editado(a)",
                  context,
                  Colors.green[400]);
        },
      ),
    );
  }
}
