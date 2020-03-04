import 'package:eliana_app/app/modules/orders/rents_orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mobx/mobx.dart';

import '../../alert_dialog_yes_no.dart';
import '../rent_order_item.dart';

class BuildListRentsOrders extends StatelessWidget {
  final ObservableList listStream;

  const BuildListRentsOrders({Key key, this.listStream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RentsOrdersController controller = Modular.get();
    return AnimationLimiter(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        addAutomaticKeepAlives: true,
        itemCount: listStream.length,
        itemBuilder: (BuildContext context, int index) {
          CustomListItem listItem = listStream[index];
          return AnimationConfiguration.staggeredList(
            position: index,
            child: ScaleAnimation(
              child: Container(
                child: Dismissible(
                    key: ValueKey(listItem.isOrder
                        ? listItem.order.id
                        : listItem.rent.id),
                    child: RentsOrderItem(rentOrder: listItem),
                    confirmDismiss: (_) async {
                      if (_ == DismissDirection.startToEnd)
                        await showDialog(
                            context: context,
                            builder: (_) => AlertDialogYesNo(
                                  title: listItem.isOrder
                                      ? "Excluir Encomenda"
                                      : "Excluir Aluguél",
                                  content: listItem.isOrder
                                      ? "Você deseja excluir a encomenda?"
                                      : "Você deseja excluir o aluguél?",
                                  yesFunction: () {
                                    controller.delete(listItem);
                                  },
                                ),
                            barrierDismissible: false);
                      else
                        await showDialog(
                            context: context,
                            builder: (_) => AlertDialogYesNo(
                                  title: listItem.isOrder ? "Encomenda Entregue" : "Aluguél Finalizado",
                                  content: listItem.isOrder ?
                                      "Você deseja marcar a encomenda como entregue?" :
                                      "Você deseja marcar o aluguél como entregue?",
                                  yesFunction: () {
                                    controller.delivered(listItem);
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
