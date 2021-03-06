import 'package:eliana_app/app/app_controller.dart';
import 'package:eliana_app/app/modules/products/products_controller.dart';
import 'package:eliana_app/app/shared/widgets/Items/builds_list/build_list_products.dart';
import 'package:eliana_app/app/shared/widgets/custom_drawer/custom_drawer_widget.dart';
import 'package:eliana_app/app/shared/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';

class ProductsPage extends StatefulWidget {
  final String title;
  const ProductsPage({Key key, this.title = "Products"}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  ProductsController controller = Modular.get();
  AppController appController = Modular.get();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.fromOrderCart)
          Modular.to.pushReplacementNamed('/add-product-list');
        else if (controller.fromRentCart)
          Modular.to.pushReplacementNamed('/add-product-list-rent');
        else
          Modular.to.pushReplacementNamed('/rents-orders');

        controller.fromOrderCart = false;
        controller.fromRentCart = false;
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Produtos"),
          actions: <Widget>[
            IconButton(
              color: Colors.white,
              icon: Icon(FontAwesomeIcons.list),
              onPressed: () {
                Modular.to.pushNamed('/add-product-list/');
              },
            ),
            IconButton(
              color: Colors.white,
              icon: Icon(FontAwesomeIcons.chair),
              onPressed: () {
                Modular.to.pushNamed('/add-product-list-rent/');
              },
            )
          ],
        ),
        body: Observer(builder: (context) {
          if (appController.productsStream.status == StreamStatus.waiting)
            return Center(child: LoadingAnimation());
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: BuildListProducts(products: appController.products),
              ),
              Container(
                height: 90,
                color: Colors.purple[800],
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 23.0),
                    child: Text(
                      "${appController.totalProducts} produtos",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          );
        }),
        floatingActionButton: FloatingActionButton(
          child: Icon(FontAwesomeIcons.plus),
          onPressed: () {
            Modular.to.pushNamed("/add-product/");
          },
        ),
        drawer: CustomDrawerWidget(),
      ),
    );
  }
}
