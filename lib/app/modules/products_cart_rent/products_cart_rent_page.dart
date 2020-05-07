import 'package:eliana_app/app/modules/products/products_controller.dart';
import 'package:eliana_app/app/modules/products_cart_rent/products_cart_rent_controller.dart';
import 'package:eliana_app/app/shared/models/product_rent.dart';
import 'package:eliana_app/app/shared/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app_controller.dart';

class ProductsCartRentPage extends StatefulWidget {
  final String title;
  const ProductsCartRentPage({Key key, this.title = "ProductsCartRent"})
      : super(key: key);

  @override
  _ProductsCartRentPageState createState() => _ProductsCartRentPageState();
}

class _ProductsCartRentPageState extends State<ProductsCartRentPage> {
  AppController appController = Modular.get();
  ProductsCartRentController controller = Modular.get();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Modular.to.pushReplacementNamed('/add-rent');
        appController.rent.productRents = appController.productsRent;
        return false;
      },
      child: FutureBuilder(
        future: controller.getProducts(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: LoadingAnimation(),
              );
              break;
            default:
              return Scaffold(
                appBar: AppBar(
                  title: Text("Carrinho de Alugáveis"),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(FontAwesomeIcons.archive),
                      onPressed: () {
                        Modular.to.pushReplacementNamed('/add-rent');
                        appController.rent.productRents =
                            appController.productsRent;
                      },
                    )
                  ],
                ),
                body: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount: appController.productsRent.length,
                        itemBuilder: (context, index) {
                          return Observer(
                            builder: (_) {
                              if (controller.products.isEmpty)
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              return Dismissible(
                                key: ValueKey(appController
                                    .productsRent[index].productId),
                                background: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 20.0),
                                  color: Colors.redAccent,
                                  child:
                                      Icon(Icons.delete, color: Colors.white),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(controller
                                            .products[controller.products
                                                .indexWhere((s) =>
                                                    s.id ==
                                                    appController
                                                        .productsRent[index]
                                                        .productId)]
                                            .name),
                                      ),
                                      GestureDetector(
                                        child: Container(
                                          color: Color.fromRGBO(
                                              0, 0, 0, .000000005),
                                          child: Icon(FontAwesomeIcons.minus,
                                              size: 25),
                                        ),
                                        onTap: () {
                                          controller.decrementAmount(index);
                                        },
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      GestureDetector(
                                        child: SizedBox(
                                          width: 30,
                                          child: Text(appController
                                              .productsRent[index].amount
                                              .toString()),
                                        ),
                                        onTap: () {
                                          _showDialog(context, index);
                                        },
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      GestureDetector(
                                        child: Icon(FontAwesomeIcons.plus,
                                            size: 25),
                                        onTap: () {
                                          controller.incrementAmount(index);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                direction: DismissDirection.startToEnd,
                                onDismissed: (direction) {
                                  appController.productsRent.removeWhere((t) =>
                                      t.productId ==
                                      appController
                                          .productsRent[index].productId);
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                    RaisedButton(
                      color: Colors.deepPurple,
                      child: Text(
                        "Adicionar Produtos",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {
                        Modular.to.pushReplacementNamed("/products/");
                        Modular.get<ProductsController>().fromRentCart = true;
                      },
                    ),
                    SizedBox(height: 25)
                  ],
                ),
              );
              break;
          }
        },
      ),
    );
  }

  _showDialog(BuildContext context, int index) async {
    TextEditingController textController = TextEditingController();
    textController.text = appController.productsRent[index].amount.toString();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Quantidade"),
            content: TextField(
              autofocus: true,
              keyboardType: TextInputType.numberWithOptions(decimal: false),
              controller: textController,
              onEditingComplete: () {
                if (textController.text.isEmpty)
                  appController.productsRent[index].amount = 0;
                else
                  appController.productsRent[index].amount =
                      int.parse(textController.text);
                Navigator.pop(context);
                List<ProductRent> newList = appController.productsRent;

                appController.productsRent = newList;
              },
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Confirmar"),
                onPressed: () {
                  if (textController.text.isEmpty)
                    appController.productsRent[index].amount = 0;
                  else
                    appController.productsRent[index].amount =
                        int.parse(textController.text);
                  Navigator.pop(context);
                  List<ProductRent> newList = appController.productsRent;

                  appController.productsRent = newList;
                },
              ),
            ],
          );
        });
  }
}
