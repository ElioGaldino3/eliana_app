import 'package:eliana_app/app/pages/orders/orders_controller.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/widgets/item_order.dart';
import 'package:eliana_app/app/shared/widgets/title_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app_module.dart';

class OrdersPage extends StatefulWidget {
  final String title;
  const OrdersPage({Key key, this.title = "Orders"}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    OrdersController controller = Inject<AppModule>.of().get();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TitlePage(title: "Encomendas"),
        Expanded(
          child: Observer(
            builder: (_) {
              if (controller.orders.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                            controller.orders.data['data']['orders'].length,
                        itemBuilder: (BuildContext context, int index) {
                          Order order = Order.fromJson(
                              controller.orders.data['data']['orders'][index]);
                          return Container(
                            child: OrderItem(order: order),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 90,
                      padding: EdgeInsets.only(right: 15),
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Observer(
                            builder: (_) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 13.0),
                                child: Text(
                                  '${controller.totalOrders.toString()} encomendas',
                                  style: TextStyle(fontSize: 18),
                                ),
                              );
                            },
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: FloatingActionButton(
                                onPressed: () {},
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }
            },
          ),
        )
      ],
    );
  }
}
