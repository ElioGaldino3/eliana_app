import 'package:flutter/material.dart';

import 'widgets/custom_header.dart';
import 'widgets/icon_section.dart';

class CustomDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          CustomHeader(),
          IconSection(),
          Divider(color: Colors.grey[500],)
        ],
      ),
    );
  }
}
