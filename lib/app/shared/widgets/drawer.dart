import 'package:eliana_app/app/modules/home/home_controller.dart';
import 'package:eliana_app/app/modules/home/home_module.dart';
import 'package:eliana_app/app/pages/clients/clients_page.dart';
import 'package:eliana_app/app/pages/init/init_page.dart';
import 'package:eliana_app/app/pages/orders/orders_page.dart';
import 'package:eliana_app/app/pages/products/products_page.dart';
import 'package:eliana_app/app/shared/widgets/menu_item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            controller.changePage(InitPage());
            Navigator.pop(context);
          },
          icon: FontAwesomeIcons.home,
        ),
        MenuItemDrawer(
          text: "Encomendas",
          onTap: () {
            controller.changePage(OrdersPage());
            Navigator.pop(context);
          },
          icon: FontAwesomeIcons.archive,
        ),
        MenuItemDrawer(
          text: "Aluguéis",
          onTap: () {},
          icon: FontAwesomeIcons.chair,
        ),
        MenuItemDrawer(
          text: "Produtos",
          onTap: () {
            controller.changePage(ProductsPage());
            Navigator.pop(context);
          },
          icon: FontAwesomeIcons.cube,
        ),
        MenuItemDrawer(
          text: "Clientes",
          onTap: () {
            controller.changePage(ClientsPage());
            Navigator.pop(context);
          },
          icon: FontAwesomeIcons.users,
        ),
      ],
    );
  }
}
