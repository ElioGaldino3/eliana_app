import 'package:eliana_app/app/app_controller.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/models/product_rent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddProductRentButton extends StatelessWidget {
  final Product product;

  const AddProductRentButton(this.product, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController appController = Modular.get();
    return Observer(
      builder: (_) {
        return appController.productsRent
                    .indexWhere((s) => s.productId == product.id) ==
                -1
            ? IconButton(
                onPressed: () {
                  appController.productsRent
                      .add(ProductRent(productId: product.id, amount: 1));

                  List<ProductRent> newList = appController.productsRent;
                  appController.productsRent = newList;

                  for (ProductRent item in appController.productsRent) {
                    print(item.productId);
                  }
                },
                icon: Icon(
                  FontAwesomeIcons.plus,
                  size: 23,
                ),
              )
            : IconButton(
                onPressed: () {
                  appController.productsRent
                      .removeWhere((t) => t.productId == product.id);

                  List<ProductRent> newList = appController.productsRent;
                  appController.productsRent = newList;

                  for (ProductRent item in appController.productsRent) {
                    print(item.productId);
                  }
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
