import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderSourceSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FlatButton(
            child: Text("Order"),
            onPressed: () async {
              Navigator.pop(context);
              Modular.to.pushNamed("/add-order");
            },
          ),
          FlatButton(
            child: Text("Aluguél"),
            onPressed: () async {
              Navigator.pop(context);
              Modular.to.pushNamed("/add-rent");
            },
          )
        ],
      ),
      onClosing: () {
      },
    );
  }
}
