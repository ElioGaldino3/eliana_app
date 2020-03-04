import 'package:auto_size_text/auto_size_text.dart';
import 'package:eliana_app/app/app_controller.dart';
import 'package:eliana_app/app/modules/orders/rents_orders_controller.dart';
import 'package:eliana_app/app/modules/publishers/add_order/add_order_controller.dart';
import 'package:eliana_app/app/modules/publishers/add_rent/add_rent_controller.dart';
import 'package:eliana_app/app/shared/utils/container_color.dart';
import 'package:eliana_app/app/shared/utils/date_format_portuguese.dart';
import 'package:eliana_app/app/shared/utils/day_week.dart';
import 'package:eliana_app/app/shared/utils/time_to_deliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RentsOrderItem extends StatelessWidget {
  final CustomListItem rentOrder;

  const RentsOrderItem({Key key, this.rentOrder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = rentOrder.isOrder
        ? rentOrder.order.dataDelivery
        : rentOrder.rent.dateRent;
    return GestureDetector(
      onTap: () {
        if (rentOrder.isOrder) {
          Modular.to.pushNamed('/add-order');
          Modular.get<AddOrderController>().order = rentOrder.order;
          Modular.get<AppController>().productsOrder =
              rentOrder.order.productOrders;
        } else {
          Modular.to.pushNamed('/add-rent');
          Modular.get<AddRentController>().rent = rentOrder.rent;
          Modular.get<AppController>().productsRent =
              rentOrder.rent.productRents;
        }
      },
      child: Container(
        height: 90,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: ContainerColor.containerColor(dateTime),
              blurRadius: 0,
              offset: Offset(0, 4))
        ]),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Icon(
                rentOrder.isOrder
                    ? FontAwesomeIcons.archive
                    : FontAwesomeIcons.chair,
                size: 27,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AutoSizeText(
                    "${DateFormatPortuguese.getString(dateTime)}",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  AutoSizeText(
                    "${TimeToDeliver.timeToDeliver(dateTime)}",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600]),
                  ),
                  AutoSizeText(
                    "${DayWeek.dayWeek(dateTime)}",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.chevron_right,
                  size: 35,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
