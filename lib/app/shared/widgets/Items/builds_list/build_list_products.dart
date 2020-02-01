import 'package:eliana_app/app/modules/products/products_controller.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/widgets/Items/product_item.dart';
import 'package:flutter/material.dart';
import '../../alert_dialog_yes_no.dart';

class BuildListProducts extends StatelessWidget {
  final List listStream;
  final ProductsController controller;

  const BuildListProducts({Key key, this.listStream, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listStream.length,
      itemBuilder: (BuildContext context, int index) {
        var list = Product.fromJson(listStream[index]);
        return Container(
          child: Dismissible(
              key: ValueKey(list.id),
              child: ProductItem(list),
              confirmDismiss: (_) async {
                await showDialog(
                    context: context,
                    builder: (_) => AlertDialogYesNo(
                          title: "Deletar Produto",
                          content: "Você realmente quer deletar o produto?",
                          yesFunction: () {
                            controller.deleteProduct(list.id);
                          },
                        ),
                    barrierDismissible: false);
              }),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        );
      },
    );
  }
}
