import 'package:eliana_app/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_tile.dart';

class IconSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppController controller = Modular.get();
    void _goToPage(String page) {
      if (controller.actualRouter == page)
        Navigator.pop(context);
      else {
        Navigator.pop(context);
        Modular.to.pushNamed(page);
      }
    }

    return Observer(builder: (_) {
      return Column(
        children: <Widget>[
          IconTile(
            label: 'Aluguéis e Encomendas',
            iconData: FontAwesomeIcons.archive,
            onTap: () {
              _goToPage('/rents-orders/');
            },
            highlighted: controller.actualRouter == '/rents-orders/',
          ),
          IconTile(
            label: 'Produtos',
            iconData: FontAwesomeIcons.cube,
            onTap: () {
              _goToPage('/products/');
            },
            highlighted: controller.actualRouter == '/products/',
          ),
          IconTile(
            label: 'Clientes',
            iconData: FontAwesomeIcons.users,
            onTap: () {
              _goToPage('/clients/');
            },
            highlighted: controller.actualRouter == '/clients/',
          ),
        ],
      );
    });
  }
}
