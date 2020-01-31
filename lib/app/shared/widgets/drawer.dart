import 'package:eliana_app/app/modules/home/home_controller.dart';
import 'package:eliana_app/app/modules/home/home_module.dart';
import 'package:eliana_app/app/pages/init/init_page.dart';
import 'package:eliana_app/app/shared/widgets/menu_item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController controller = Inject<HomeModule>.of().get();
    return Column(
      children: <Widget>[
        Container(
          height: 150,
          color: Colors.purple,
        ),
        MenuItemDrawer(
          text: "Início",
          onTap: () {
            controller.currentPage = InitPage();
            Navigator.pop(context);
          },
          icon: Icons.home,
        ),
        MenuItemDrawer(
          text: "Encomendas",
          onTap: () {},
          icon: Icons.shopping_cart,
        ),
        MenuItemDrawer(
          text: "Aluguéis",
          onTap: () {},
          icon: Icons.event_seat,
        ),
        MenuItemDrawer(
          text: "Produtos",
          onTap: () {},
          icon: Icons.markunread_mailbox,
        ),
        MenuItemDrawer(
          text: "Clientes",
          onTap: () {},
          icon: Icons.face,
        ),
      ],
    );
  }
}
