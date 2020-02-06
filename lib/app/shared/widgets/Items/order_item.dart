import 'package:auto_size_text/auto_size_text.dart';
import 'package:eliana_app/app/modules/publishers/add_order/add_order_controller.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/utils/container_color.dart';
import 'package:eliana_app/app/shared/utils/date_format_portuguese.dart';
import 'package:eliana_app/app/shared/utils/day_week.dart';
import 'package:eliana_app/app/shared/utils/time_to_deliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  const OrderItem({Key key, this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/add-order');
        AddOrderController addController = Modular.get();
        addController.order = order;
      },
      child: Container(
        height: 90,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: ContainerColor.containerColor(order.dataDelivery),
                  blurRadius: 0,
                  offset: Offset(0, 4))
            ]),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Icon(
                FontAwesomeIcons.archive,
                size: 27,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AutoSizeText(
                    "${DateFormatPortuguese.getString(order.dataDelivery)}",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  AutoSizeText(
                    "${TimeToDeliver.timeToDeliver(order.dataDelivery)}",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.grey[600]),
                  ),
                  AutoSizeText(
                    "${DayWeek.dayWeek(order.dataDelivery)}",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: Colors.grey[500]),
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
