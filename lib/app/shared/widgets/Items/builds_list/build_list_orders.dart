import 'package:eliana_app/app/modules/orders/orders_controller.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/widgets/Items/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../alert_dialog_yes_no.dart';

class BuildListOrders extends StatelessWidget {
  final List listStream;

  const BuildListOrders({Key key, this.listStream})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersController controller = Modular.get();
    return AnimationLimiter(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        addAutomaticKeepAlives: true,
        itemCount: controller.orders.data['data']['orders'].length,
        itemBuilder: (BuildContext context, int index) {
          Order order =
              Order.fromJson(controller.orders.data['data']['orders'][index]);
          return AnimationConfiguration.staggeredList(
            position: index,
            child: ScaleAnimation(
              child: Container(
                child: Dismissible(
                    key: ValueKey(order.id),
                    child: OrderItem(order: order),
                    confirmDismiss: (_) async {
                      if (_ == DismissDirection.startToEnd)
                        await showDialog(
                            context: context,
                            builder: (_) => AlertDialogYesNo(
                                  title: "Excluir Encomenda",
                                  content: "Você deseja excluir a encomenda?",
                                  yesFunction: () {
                                    controller.deleteOrder(order.id);
                                  },
                                ),
                            barrierDismissible: false);
                      else
                        await showDialog(
                            context: context,
                            builder: (_) => AlertDialogYesNo(
                                  title: "Encomenda Entregue",
                                  content:
                                      "Você deseja marcar a encomenda como entregue?",
                                  yesFunction: () {
                                    controller.deliveredOrder(order.id);
                                  },
                                ),
                            barrierDismissible: false);
                    }),
                padding: EdgeInsets.only(bottom: 4),
              ),
            ),
          );
        },
      ),
    );
  }
}
