import 'package:flutter/material.dart';

class MenuItemDrawer extends StatelessWidget {
  final String text;
  final Function onTap;
  final IconData icon;

  const MenuItemDrawer({Key key, this.text, this.onTap, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 6),
          child: Row(
            children: <Widget>[
              Icon(icon),
              Padding(padding: EdgeInsets.only(left: 15), child: Text(text))
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
