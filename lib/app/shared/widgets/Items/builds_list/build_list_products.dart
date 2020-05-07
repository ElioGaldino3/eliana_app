import 'package:eliana_app/app/modules/products/products_controller.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/widgets/Items/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mobx/mobx.dart';

import '../../alert_dialog_yes_no.dart';

class BuildListProducts extends StatelessWidget {
  final ObservableList<Product> products;

  const BuildListProducts({Key key, this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
        child: ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return AnimationConfiguration.staggeredList(
            position: index,
            child: ScaleAnimation(
                child: Container(
              child: Dismissible(
                  direction: DismissDirection.startToEnd,
                  key: ValueKey(products[index].id),
                  child: ProductItem(products[index]),
                  confirmDismiss: (_) async => await showDialog(
                        context: context,
                        builder: (_) => AlertDialogYesNo(
                              title: "Deletar Produto",
                              content: "Você realmente quer deletar o(a) ${products[index].name}?",
                              yesFunction: () {
                                Modular.get<ProductsController>().deleteProduct(products[index].id);
                              },
                            ),
                        barrierDismissible: false)),
              padding: EdgeInsets.only(bottom: 3),
            )));
      },
    ));
  }
}
