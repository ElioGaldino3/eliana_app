import 'package:eliana_app/app/modules/publishers/add_order/add_order_controller.dart';
import 'package:eliana_app/app/shared/models/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class AddOrderPage extends StatefulWidget {
  @override
  _AddOrderPageState createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {
  AddOrderController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Encomenda"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Cliente:"),
                Observer(builder: (_) {
                  return DropdownButton(
                    value: controller.selectedClient,
                    items: controller.dropDownMenuItems,
                    onChanged: (Client s) {
                      controller.selectedClient = s;
                    },
                  );
                }),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    controller.changeOption(4);
                  },
                  child: Text("velhooo"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
