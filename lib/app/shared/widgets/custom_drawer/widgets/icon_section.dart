import 'package:eliana_app/app/modules/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_tile.dart';

class IconSection extends StatelessWidget {
  BaseController baseController = Modular.get();

  @override
  Widget build(BuildContext context) {
    void _setPage(int page) {
      Navigator.pop(context);
      baseController.changePage(page);
    }

    return Observer(
      builder: (_) {
        return Column(
          children: <Widget>[
            IconTile(
              label: 'Encomendas',
              iconData: FontAwesomeIcons.archive,
              onTap: () {
                _setPage(0);
              },
              highlighted: baseController.currentPage == 0,
            ),
            IconTile(
              label: 'Aluguéis',
              iconData: FontAwesomeIcons.chair,
              onTap: () {
                _setPage(1);
              },
              highlighted: baseController.currentPage == 1,
            ),
            IconTile(
              label: 'Produtos',
              iconData: FontAwesomeIcons.cube,
              onTap: () {
                _setPage(2);
              },
              highlighted: baseController.currentPage == 2,
            ),
            IconTile(
              label: 'Clientes',
              iconData: FontAwesomeIcons.users,
              onTap: () {
                _setPage(3);
              },
              highlighted: baseController.currentPage == 3,
            ),
          ],
        );
      },
    );
  }
}
