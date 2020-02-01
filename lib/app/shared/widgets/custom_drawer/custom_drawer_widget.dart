import 'package:flutter/material.dart';

import 'widgets/custom_header.dart';
import 'widgets/icon_section.dart';

class CustomDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: paddingTop,
            color: Colors.purple[700],
          ),
          Expanded(
            
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                CustomHeader(),
                IconSection(),
                Divider(
                  color: Colors.grey[500],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
