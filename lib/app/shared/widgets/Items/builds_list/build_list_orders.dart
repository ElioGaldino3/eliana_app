import 'package:eliana_app/app/modules/orders/orders_controller.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/widgets/Items/order_item.dart';
import 'package:flutter/material.dart';

import '../../alert_dialog_yes_no.dart';

class BuildListOrders extends StatelessWidget {
  final List listStream;
  final OrdersController controller;

  const BuildListOrders({Key key, this.listStream, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                    itemCount: controller.orders.data['data']['orders'].length,
                    itemBuilder: (BuildContext context, int index) {
                      Order order = Order.fromJson(
                          controller.orders.data['data']['orders'][index]);
                      return Container(
                        child: Dismissible(
                            key: ValueKey(order.id),
                            child: OrderItem(order: order),
                            confirmDismiss: (_) async {
                              await showDialog(
                                  context: context,
                                  builder: (_) => AlertDialogYesNo(
                                        title: "Excluir Encomenda",
                                        content:
                                            "Você deseja excluir a encomenda?",
                                        yesFunction: () {
                                          controller.deleteOrder(order.id);
                                        },
                                      ),
                                  barrierDismissible: false);
                            }),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      );
                    },
                  );
  }
}
