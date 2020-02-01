import 'package:eliana_app/app/modules/products/products_controller.dart';
import 'package:eliana_app/app/shared/widgets/Items/builds_list/build_list_products.dart';
import 'package:eliana_app/app/shared/widgets/custom_drawer/custom_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductsPage extends StatefulWidget {
  final String title;
  const ProductsPage({Key key, this.title = "Products"}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  ProductsController controller = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produtos"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Observer(
              builder: (_) {
                if (controller.products.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return BuildListProducts(
                    listStream: controller.products.data['data']['products'],
                    controller: controller,
                  );
                }
              },
            ),
          ),
          Container(
            height: 90,
            color: Colors.grey[200],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.plus),
        onPressed: () {},
      ),
      drawer: CustomDrawerWidget(),
    );
  }
}
