import 'package:eliana_app/app/app_repository.dart';
import 'package:eliana_app/app/modules/add_product/add_product_module.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';
import 'add_product_controller.dart';

class AddProductPage extends StatefulWidget {
  int id;
  AddProductPage({this.id});
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  Product product;
  final AddProductController productAddController =
      Inject<AddProductModule>.of().get();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print("ID: ${widget.id}");
    if (widget.id != null) {
      AppRepository repo = AppModule.to.get<AppRepository>();
      repo.getProduct(widget.id);
    }
    double screenHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Column(children: <Widget>[
        Container(
          height: screenHeight,
          color: Colors.deepPurple,
        ),
        Container(
          height: 60,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              child: Text(
                'Adicionar Produto',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              padding: EdgeInsets.only(left: 18),
            ),
          ),
        ),
        Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: productAddController.textNameController,
                  validator: (value) {
                    if (value.isEmpty) return 'Please enter some text';
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Nome do produto'),
                ),
                TextFormField(
                  controller: productAddController.textValueController,
                  validator: (value) {
                    if (value.isEmpty)
                      return 'Por favor, coloque o nome do produto';
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Valor do produto'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      color: Colors.grey,
                      height: 250,
                      width: 250,
                      child: Center(
                        child: IconButton(
                          icon: Icon(Icons.add_a_photo),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {},
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
