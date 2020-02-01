import 'package:eliana_app/app/modules/base/base_controller.dart';
import 'package:eliana_app/app/modules/orders/orders_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BasePage extends StatefulWidget {
  final String title;
  const BasePage({Key key, this.title = "Base"}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  BaseController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return PageView(
          controller: controller.pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            OrdersPage(),
            Container(color: Colors.blue),
            Container(color: Colors.red),
            Container(color: Colors.blue),
          ],
        );
      }),
    );
  }
}
