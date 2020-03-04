import 'package:eliana_app/app/app_controller.dart';
import 'package:eliana_app/app/modules/publishers/add_order/add_order_controller.dart';
import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/widgets/custom_date_picker.dart';
import 'package:eliana_app/app/shared/widgets/loading_animation.dart';
import 'package:eliana_app/app/shared/widgets/show_toast.dart';
import 'package:flare_flutter/flare_actor.dart';
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
  AppController appController = Modular.get();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Modular.to.pushReplacementNamed('/rents-orders');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Adicionar Encomenda"),
        ),
        body: Observer(
          builder: (context) {
            if (appController.clientsStream.status == StreamStatus.waiting ||
                appController.productsStream.status == StreamStatus.waiting) {
              return Center(child: LoadingAnimation());
            }
            //controller.getClients();
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Column(
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: DropdownButton(
                                          value: controller.selectedClient,
                                          items: controller.dropDownMenuItems,
                                          onChanged: (Client s) {
                                            controller.selectedClient = s;
                                            appController.order.client = s;
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
                                  return CustomDatePicker(false,
                                      date: appController.order.dataDelivery,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 9.0),
                                          child: Text("Ir para o carrinho"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    AppController appController = Modular.get();
                                    Modular.to.pushReplacementNamed(
                                        '/add-product-list');
                                    appController.productsOrder =
                                        appController.order.productOrders;
                                  },
                                ),
                                SizedBox(height: 15),
                                TextField(
                                  controller: controller.commentController,
                                  decoration: InputDecoration(
                                    labelText: "Comentário",
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.white,
                  height: 90,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Observer(builder: (_) {
                      return Text(
                        "Total: R\$${controller.total.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      );
                    }),
                  ),
                )
              ],
            );
          },
        ),
        floatingActionButton: Observer(builder: (_) {
          return FloatingActionButton(
            onPressed: controller.isPut
                ? null
                : () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    controller.putOrder();
                    ShowToast.showCustomToast(
                        FontAwesomeIcons.solidCheckCircle,
                        "Encomenda salvada com sucesso!",
                        context,
                        Colors.green[400]);
                  },
            child: Icon(FontAwesomeIcons.save),
          );
        }),
      ),
    );
  }
}
