import 'package:eliana_app/app/modules/orders/orders_controller.dart';
import 'package:eliana_app/app/shared/widgets/Items/builds_list/build_list_orders.dart';
import 'package:eliana_app/app/shared/widgets/custom_drawer/custom_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  OrdersController controller = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawerWidget(),
      appBar: AppBar(
        title: Text("Encomendas"),
      ),
      body: FutureBuilder(
          future: controller.getOrders(),
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
                    Expanded(
                      child: Observer(
                        builder: (_) {
                          if (controller.orders.data == null) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return BuildListOrders(
                              listStream: controller.orders.data['data']
                                  ['orders'],
                              controller: controller,
                            );
                          }
                        },
                      ),
                    ),
                    Container(
                      height: 90,
                      color: Colors.grey[200],
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 23.0),
                          child: Observer(builder: (_) {
                            return Text(
                              "${controller.total} encomendas",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            );
                          }),
                        ),
                      ),
                    )
                  ],
                );
                break;
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.plus),
        onPressed: () {
          Modular.to.pushNamed("/add-order/");
        },
      ),
    );
  }
}
