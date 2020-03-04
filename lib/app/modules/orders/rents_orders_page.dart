import 'package:eliana_app/app/app_controller.dart';
import 'package:eliana_app/app/shared/widgets/Items/builds_list/build_list_rents_orders.dart';
import 'package:eliana_app/app/shared/widgets/add_order_sheet.dart';
import 'package:eliana_app/app/shared/widgets/custom_drawer/custom_drawer_widget.dart';
import 'package:eliana_app/app/shared/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';

import 'rents_orders_controller.dart';

class RentsOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RentsOrdersController controller = Modular.get();
    AppController appController = Modular.get();
    return Scaffold(
      drawer: CustomDrawerWidget(),
      appBar: AppBar(
        title: Text("Aluguéis e Encomendas"),
      ),
      body: Observer(
        builder: (_) {
          if (controller.orders.status == StreamStatus.waiting ||
              controller.rents.status == StreamStatus.waiting ||
              appController.productsStream.status == StreamStatus.waiting ||
              appController.clientsStream.status == StreamStatus.waiting) {
            return Center(child: LoadingAnimation());
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child:
                      BuildListRentsOrders(listStream: controller.customList),
                ),
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
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(FontAwesomeIcons.plus),
          onPressed: () {
            showModalBottomSheet(
                context: context, builder: (context) => OrderSourceSheet());
          }),
    );
  }
}
