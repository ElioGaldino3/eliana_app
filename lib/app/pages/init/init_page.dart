import 'package:eliana_app/app/modules/home/home_controller.dart';
import 'package:eliana_app/app/modules/home/home_module.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/widgets/drawer.dart';
import 'package:eliana_app/app/shared/widgets/item_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InitPage extends StatefulWidget {
  final String title;
  const InitPage({Key key, this.title = "Init"}) : super(key: key);

  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  Widget build(BuildContext context) {
    HomeController controller = Inject<HomeModule>.of().get();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          child: Text(
            "Início",
            style: TextStyle(fontSize: 17),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        Expanded(
          child: Observer(
            builder: (_) {
              if (controller.orders.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: controller.orders.data['data']['orders'].length,
                  itemBuilder: (BuildContext context, int index) {
                    Order order = Order.fromJson(
                        controller.orders.data['data']['orders'][index]);
                    return Container(
                      child: OrderItem(order: order),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    );
                  },
                );
              }
            },
          ),
        )
      ],
    );
  }
}
