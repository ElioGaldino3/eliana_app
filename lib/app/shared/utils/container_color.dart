import 'package:flutter/material.dart';

class ContainerColor {

  static Color containerColor(DateTime data) {
    int diffHours = data.difference(DateTime.now()).inHours;

    if (diffHours <= 0 && diffHours >= -24) {
      return Colors.red;
    } else if (diffHours < -24) {
      return Colors.grey;
    } else if (diffHours <= 24) {
      return Colors.orange;
    } else if (diffHours > 24 && diffHours < 48) {
      return Colors.yellow[600];
    } else {
      return Colors.green;
    }
  }

}
