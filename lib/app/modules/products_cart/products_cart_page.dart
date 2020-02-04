import 'package:eliana_app/app/app_controller.dart';
import 'package:eliana_app/app/modules/products_cart/products_cart_controller.dart';
import 'package:eliana_app/app/modules/publishers/add_order/add_order_controller.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductsCartPage extends StatefulWidget {
  @override
  _ProductsCartPageState createState() => _ProductsCartPageState();
}

class _ProductsCartPageState extends State<ProductsCartPage> {
  AppController appController = Modular.get();
  ProductsCartController controller = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho de Produtos"),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.archive),
            onPressed: () {
              Modular.to.pushNamedAndRemoveUntil('/add-order/', ModalRoute.withName('/orders/'));
              AddOrderController addController = Modular.get();
              addController.order.productOrders = appController.productsOrder;
              Order newOrder = addController.order;
              addController.order = newOrder;
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: appController.productsOrder.length,
              itemBuilder: (context, index) {
                return Observer(
                  builder: (_) {
                    if (controller.products.isEmpty)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    return Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(controller
                                .products[controller.products.indexWhere((s) =>
                                    s.id ==
                                    appController
                                        .productsOrder[index].idProduct)]
                                .name),
                          ),
                          GestureDetector(
                            child: Container(
                              color: Color.fromRGBO(0, 0, 0, .000000005),
                              child: Icon(FontAwesomeIcons.minus, size: 25),
                            ),
                            onTap: () {
                              controller.decrementAmount(index);
                            },
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          SizedBox(
                            width: 30,
                            child: Text(appController
                                .productsOrder[index].amount
                                .toString()),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            child: Icon(FontAwesomeIcons.plus, size: 25),
                            onTap: () {
                              controller.incrementAmount(index);
                            },
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          RaisedButton(
            child: Text("Adicionar Produtos"),
            onPressed: () {
              Modular.to.pushNamed("/products/");
            },
          )
        ],
      ),
    );
  }
}
