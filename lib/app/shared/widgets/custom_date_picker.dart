import 'package:eliana_app/app/modules/publishers/add_order/add_order_controller.dart';
import 'package:eliana_app/app/modules/publishers/add_rent/add_rent_controller.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:eliana_app/app/shared/utils/date_format_portuguese.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDatePicker extends StatelessWidget {
  final LocaleType locale;
  final AddRentController rentController;
  final AddOrderController controller;

  const CustomDatePicker(
      {Key key, this.locale, this.rentController, this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isRent = rentController != null;
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
                  child: isRent
                      ? Text(DateFormatPortuguese.getString(
                          rentController.rent.dateRent))
                      : Text(DateFormatPortuguese.getString(
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
            onConfirm: (newDate) {
              if (!isRent) {
                Order newOrder = controller.order;
                newOrder.dataDelivery = newDate;
                controller.order = newOrder;
              } else {
                Rent newRent = rentController.rent;
                newRent.dateRent = newDate;
                rentController.rent = newRent;
              }
            },
            currentTime: isRent
                ? rentController.rent.dateRent
                : controller.order.dataDelivery,
            locale: locale,
          );
        },
      ),
    );
  }
}
