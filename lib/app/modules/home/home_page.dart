import 'package:eliana_app/app/modules/home/home_controller.dart';
import 'package:eliana_app/app/modules/home/home_module.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/widgets/drawer.dart';
import 'package:eliana_app/app/shared/widgets/item_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController controller = Inject<HomeModule>.of().get();
    double topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Eliana Personalizações",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          return controller.currentPage;
        },
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: topPadding,
              color: Colors.deepPurple,
            ),
            DrawerScaffold()
          ],
        ),
      ),
    );
  }
}
