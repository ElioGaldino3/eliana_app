import 'package:eliana_app/app/app_controller.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/models/product_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddProductOrderButton extends StatelessWidget {
  final Product product;

  const AddProductOrderButton(this.product, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController appController = Modular.get();
    return Observer(
      builder: (_) {
        return appController.productsOrder
                    .indexWhere((s) => s.idProduct == product.id) ==
                -1
            ? IconButton(
                onPressed: () {
                  appController.productsOrder
                      .add(ProductOrder(idProduct: product.id, amount: 1));

                  List<ProductOrder> newList = appController.productsOrder;
                  appController.productsOrder = newList;
                },
                icon: Icon(
                  FontAwesomeIcons.plus,
                  size: 23,
                ),
              )
            : IconButton(
                onPressed: () {
                  appController.productsOrder
                      .removeWhere((t) => t.idProduct == product.id);

                  List<ProductOrder> newList = appController.productsOrder;
                  appController.productsOrder = newList;
                },
                icon: Icon(
                  FontAwesomeIcons.minus,
                  size: 23,
                ),
              );
      },
    );
  }
}
