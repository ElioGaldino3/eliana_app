import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/widgets/custom_date_picker.dart';
import 'package:eliana_app/app/shared/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../app_controller.dart';
import 'add_rent_controller.dart';

class AddRentPage extends StatefulWidget {
  final String title;
  const AddRentPage({Key key, this.title = "AddRent"}) : super(key: key);

  @override
  _AddRentPageState createState() => _AddRentPageState();
}

class _AddRentPageState extends State<AddRentPage> {
  AddRentController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Aluguél"),
      ),
      body: FutureBuilder(
          future: controller.getClients(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              default:
                return Column(
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
                            return CustomDatePicker(
                                rentController: controller,
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
                              Modular.to.pushNamed('/add-product-list-rent/');
                              appController.productsRent =
                                  controller.rent.productRents;
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
                break;
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          controller.putOrder();
          ShowToast.showCustomToast(FontAwesomeIcons.solidCheckCircle,
              "Aluguél salvo com sucesso!", context, Colors.green[400]);
        },
        child: Icon(FontAwesomeIcons.save),
      ),
    );
  }
}
