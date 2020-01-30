import 'package:eliana_app/app/shared/widgets/menu_item_drawer.dart';
import 'package:flutter/material.dart';

class DrawerScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 150,
          color: Colors.purple,
        ),
        MenuItemDrawer(text: "Início", onTap: (){}, icon: Icons.home,),
        MenuItemDrawer(text: "Encomendas", onTap: (){}, icon: Icons.shopping_cart,),
        MenuItemDrawer(text: "Aluguéis", onTap: (){}, icon: Icons.event_seat,),
        MenuItemDrawer(text: "Produtos", onTap: (){}, icon: Icons.markunread_mailbox,),
        MenuItemDrawer(text: "Clientes", onTap: (){}, icon: Icons.face,),
      ],
    );
  }
}
