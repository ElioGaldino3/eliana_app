import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListProductsSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FlatButton(
            child: Text("Encomendas"),
            onPressed: () {
             Modular.to.pushNamed('/add-product-list/');
            },
          ),
          FlatButton(
            child: Text("Aluguél"),
            onPressed: () {
              Modular.to.pushNamed('/add-product-list-rent/');
            },
          )
        ],
      ),
      onClosing: () {},
    );
  }
}
