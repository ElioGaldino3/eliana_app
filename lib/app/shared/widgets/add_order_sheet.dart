import 'package:eliana_app/app/app_controller.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderSourceSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppController appController = Modular.get();
    return BottomSheet(
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FlatButton(
            child: Text("Encomenda"),
            onPressed: () async {
              Navigator.pop(context);
              Modular.to.pushReplacementNamed("/add-order");
              appController.order = Order(dataDelivery: DateTime.now(), productOrders: []);
            },
          ),
          FlatButton(
            child: Text("Aluguél"),
            onPressed: () async {
              Navigator.pop(context);
              Modular.to.pushReplacementNamed("/add-rent");
              appController.rent = Rent(dateRent: DateTime.now(), productRents: []);
            },
          )
        ],
      ),
      onClosing: () {
      },
    );
  }
}
