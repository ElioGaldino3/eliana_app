import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  final String title;

  const TitlePage({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Text(
        title,
        style: TextStyle(fontSize: 17),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    );
  }
}
