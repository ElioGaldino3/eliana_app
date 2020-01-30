import 'package:eliana_app/app/modules/home/home_controller.dart';
import 'package:eliana_app/app/modules/home/home_module.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/widgets/drawer.dart';
import 'package:eliana_app/app/shared/widgets/item_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController controller = Inject<HomeModule>.of().get();
    double topPadding = MediaQuery.of(context).padding.top;
    return Observer(
      builder: (_) {
        if (controller.orders.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Eliana Personalizações",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
            ),
            body: Column(
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
                  child: ListView.builder(
                    itemCount: controller.orders.data['data']['orders'].length,
                    itemBuilder: (BuildContext context, int index) {
                      Order order = Order.fromJson(
                          controller.orders.data['data']['orders'][index]);
                      return Container(
                        child: OrderItem(order: order),
                        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                      );
                    },
                  ),
                )
              ],
            ),
            drawer: Drawer(
              child: Column(
                children: <Widget>[
                  Container(
                    height: topPadding,
                    color: Colors.deepPurple,
                  ),
                  DrawerScaffold()
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
