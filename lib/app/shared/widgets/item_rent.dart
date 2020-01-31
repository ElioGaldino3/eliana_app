import 'package:auto_size_text/auto_size_text.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:eliana_app/app/shared/utils/formatDate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RentItem extends StatelessWidget {
  final Rent rent;

  const RentItem({Key key, this.rent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
          color: _getContainerColor(rent.dateRent),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, .27),
                blurRadius: 10.5,
                offset: Offset(3, 10))
          ]),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Icon(
              FontAwesomeIcons.chair,
              size: 27,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AutoSizeText(
                  "${PortugueseLocale(rent.dateRent).getDate()}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                AutoSizeText(
                  "${_dayDelivery(rent.dateRent)}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                AutoSizeText(
                  "${_dayWeek(rent.dateRent)}",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
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
    );
  }
}

Color _getContainerColor(DateTime data) {
  int diffHours = data.difference(DateTime.now()).inHours;

  if (diffHours <= 0 && diffHours >= -24) {
    return Colors.red;
  } else if (diffHours < -24) {
    return Colors.grey;
  } else if (diffHours <= 24) {
    return Colors.orange;
  } else if (diffHours > 24 && diffHours < 48) {
    return Color.fromRGBO(255, 202, 40, 1);
  } else {
    return Colors.green;
  }
}

String _dayDelivery(DateTime date) {
  int diffHours = date.difference(DateTime.now()).inHours;
  int diffDay = date.difference(DateTime.now()).inDays;
  print(diffDay);
  if (diffHours <= 0 && diffHours >= -24) {
    return "Entregar hoje!";
  } else if (diffHours < -24) {
    return "Entrega atrasada!";
  } else if (diffHours <= 24) {
    return "Entregar amanha!";
  } else {
    return "Falta ${diffDay + 1} dias para entregar!";
  }
}

String _dayWeek(DateTime date) {
  switch (date.weekday) {
    case 1:
      return "Segunda-feira";
      break;
    case 2:
      return "Terça-feira";
      break;
    case 3:
      return "Quarta-feira";
      break;
    case 4:
      return "Quinta-feira";
      break;
    case 5:
      return "Sexta-feira";
      break;
    case 6:
      return "Sábado";
      break;
    case 7:
      return "Domingo";
      break;
  }
}
