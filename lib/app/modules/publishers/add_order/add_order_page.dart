import 'package:eliana_app/app/modules/publishers/add_order/add_order_controller.dart';
import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/widgets/custom_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                  return Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.users),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: DropdownButton(
                          value: controller.selectedClient,
                          items: controller.dropDownMenuItems,
                          onChanged: (Client s) {
                            controller.selectedClient = s;
                          },
                        ),
                      ),
                    ],
                  );
                }),
                SizedBox(
                  height: 20,
                ),
                Text("Data de entrega:"),
                Observer(builder: (_) {
                  return CustomDatePicker(controller.order.dataDelivery,
                      locale: LocaleType.pt);
                }),
                SizedBox(
                  height: 7,
                ),
                Text("Carrinho de Produtos:"),
                SizedBox(height: 15),
                GestureDetector(
                  child: Container(
                    color: Color.fromRGBO(0, 0, 0, .0000004),
                    child: Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.shoppingCart),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9.0),
                          child: Text("Ir para o carrinho"),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    print("indo para o carrinho");
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            height: 90,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Total: R\$${controller.total.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          controller.putOrder();
        },
        child: Icon(FontAwesomeIcons.save),
      ),
    );
  }
}
