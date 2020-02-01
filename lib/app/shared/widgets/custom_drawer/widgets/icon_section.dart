import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_tile.dart';

class IconSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _goToPage(String page) {
      Navigator.pop(context);
      Modular.to.pushNamed(page);
    }

    return Column(
      children: <Widget>[
        IconTile(
          label: 'Encomendas',
          iconData: FontAwesomeIcons.archive,
          onTap: () {
            _goToPage('/');
          },
          highlighted: Modular.actualRoute == '/',
        ),
        IconTile(
          label: 'Aluguéis',
          iconData: FontAwesomeIcons.chair,
          onTap: () {
            _goToPage('/rents/');
          },
          highlighted: Modular.actualRoute == '/rents/',
        ),
        IconTile(
          label: 'Produtos',
          iconData: FontAwesomeIcons.cube,
          onTap: () {
            _goToPage('/products/');
          },
          highlighted: Modular.actualRoute == '/products/',
        ),
        IconTile(
          label: 'Clientes',
          iconData: FontAwesomeIcons.users,
          onTap: () {
            _goToPage('/clients/');
          },
          highlighted: Modular.actualRoute == '/clients/',
        ),
      ],
    );
  }
}
