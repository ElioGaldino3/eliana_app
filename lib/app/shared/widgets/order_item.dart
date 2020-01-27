import 'package:eliana_app/app/shared/models/order.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderItem extends StatelessWidget {
  final Order data;

  const OrderItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: getColor(data.dateTime),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: EdgeInsets.only(left: 15),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.boxes),
              onPressed: () {},
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data.dateTime.toString(),
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Falta ${data.dateTime.difference(DateTime.now()).inDays} dias para entregar",
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 6),
              child: IconButton(
                icon: Icon(FontAwesomeIcons.arrowCircleRight),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }

  Color getColor(DateTime date) {
    final int diffDays = date.difference(DateTime.now()).inDays;

    if (diffDays == 0)
      return Colors.red;
    else if (diffDays > 0 && diffDays <= 1)
      return Color.fromARGB(255, 255, 112, 67);
    else if (diffDays > 1 && diffDays <= 3)
      return Color.fromARGB(255, 255, 202, 40);
    else
      return Colors.green;
  }
}
