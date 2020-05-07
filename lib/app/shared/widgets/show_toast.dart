import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class ShowToast {
  static showCustomToast(IconData data, String mensage, BuildContext context, Color color) {
    double widthPage = MediaQuery.of(context).size.width;
    showToastWidget(
      Container(
        height: 80,
        width: widthPage * 0.85,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              data,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(width: 20),
            Text(
              mensage,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              overflow: TextOverflow.fade,
            )
          ],
        ),
      ),
      duration: Duration(seconds: 2),
      animationCurve: Curves.easeIn,
      dismissOtherToast: true,
      position: ToastPosition.bottom,
    );
  }
}
