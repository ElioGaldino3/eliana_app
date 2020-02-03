import 'package:eliana_app/app/modules/publishers/add_order/add_order_controller.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/utils/date_format_portuguese.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime date;
  final LocaleType locale;

  const CustomDatePicker(this.date, {Key key, this.locale}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AddOrderController controller = Modular.get();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        child: Container(
          color: Color.fromRGBO(0, 0, 0, .000005),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.calendarAlt),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(DateFormatPortuguese.getString(
                      controller.order.dataDelivery)),
                )
              ],
            ),
          ),
        ),
        onTap: () {
          DatePicker.showDatePicker(
            context,
            showTitleActions: true,
            minTime: DateTime.now().subtract(Duration(days: 15)),
            maxTime: DateTime.now().add(Duration(days: 600)),
            onChanged: (changeDate) {},
            onConfirm: (newDate) {
              Order newOrder = controller.order;
              newOrder.dataDelivery = newDate;
              controller.order = newOrder;
            },
            currentTime: controller.order.dataDelivery,
            locale: locale,
          );
        },
      ),
    );
  }
}
