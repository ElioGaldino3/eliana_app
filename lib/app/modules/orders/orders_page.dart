import 'package:eliana_app/app/modules/orders/orders_controller.dart';
import 'package:eliana_app/app/shared/widgets/Items/builds_list/build_list_orders.dart';
import 'package:eliana_app/app/shared/widgets/custom_drawer/custom_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OrdersController controller = Modular.get();
    return Observer(builder: (_) {
      if (controller.orders.status == StreamStatus.waiting) {
        return Center(child: CircularProgressIndicator());
      } else {
        return Scaffold(
          drawer: CustomDrawerWidget(),
          appBar: AppBar(
            title: Text("Encomendas"),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: BuildListOrders(
                listStream: controller.orders.data['data']['orders'],
              )),
              Container(
                height: 90,
                color: Colors.purple[700],
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 23.0),
                    child: Text(
                      "${controller.total} encomendas",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(FontAwesomeIcons.plus),
            onPressed: () {
              Modular.to.pushNamed("/add-order/");
            },
          ),
        );
      }
    });
  }
}
