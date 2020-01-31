import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/utils/formatDate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  const OrderItem({Key key, this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
          color: _getContainerColor(order.dataDelivery),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, .16),
                blurRadius: 10.5,
                offset: Offset(3, 10))
          ]),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Icon(
              Icons.markunread_mailbox,
              size: 32,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "${PortugueseLocale(order.dataDelivery).getDate()}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(
                "Falta ${order.dataDelivery.difference(DateTime.now()).inDays} dias para entregar",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
              )
            ],
          ),
          Expanded(
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
    );
  }
}

Color _getContainerColor(DateTime data) {
  int diffDay = data.difference(DateTime.now()).inDays;

  switch (diffDay) {
    case 1:
      return Colors.red;
      break;
    case 2:
      return Colors.orange;
      break;
    case 3:
      return Color.fromRGBO(255, 202, 40, 1);
      break;
    default:
      return Colors.green;
      break;
  }
}
