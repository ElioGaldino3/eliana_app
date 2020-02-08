import 'package:eliana_app/app/modules/calendar/calendar_controller.dart';
import 'package:eliana_app/app/modules/rents/rents_controller.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../alert_dialog_yes_no.dart';
import '../item_rent.dart';

class BuildListRents extends StatelessWidget {
  final List listStream;

  const BuildListRents({Key key, this.listStream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CalendarPageController calendar = Modular.get();
    RentsController controller = Modular.get();
    return AnimationLimiter(
        child: ListView.builder(
      itemCount: calendar.rents.data['data']['rents'].length,
      itemBuilder: (BuildContext context, int index) {
        var json = calendar.rents.data['data']['rents'][index];
        Rent rent = Rent.fromJson(json);
        return AnimationConfiguration.staggeredList(
            position: index,
            child: ScaleAnimation(
                child: Container(
              child: Dismissible(
                  key: ValueKey(rent.id),
                  child: RentItem(rent: rent),
                  confirmDismiss: (_) async {
                    if (_ == DismissDirection.startToEnd)
                      await showDialog(
                          context: context,
                          builder: (_) => AlertDialogYesNo(
                                title: "Excluir Aluguél",
                                content: "Você deseja excluir este aluguél?",
                                yesFunction: () {
                                  controller.deleteRent(rent.id);
                                },
                              ),
                          barrierDismissible: false);
                    else
                      await showDialog(
                          context: context,
                          builder: (_) => AlertDialogYesNo(
                                title: "Aluguél Finalizado",
                                content:
                                    "Você deseja marcar este aluguel como finalizado?",
                                yesFunction: () {
                                  controller.deliveredRent(rent.id);
                                },
                              ),
                          barrierDismissible: false);
                  }),
              padding: EdgeInsets.only(bottom: 4),
            )));
      },
    ));
  }
}
