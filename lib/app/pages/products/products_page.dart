import 'package:eliana_app/app/app_module.dart';
import 'package:eliana_app/app/pages/products/products_controller.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/widgets/item_product.dart';
import 'package:eliana_app/app/shared/widgets/title_page.dart';
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
  ProductsController controller = Inject<AppModule>.of().get();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TitlePage(title: "Produtos"),
        Expanded(
          child: Observer(
            builder: (_) {
              if (controller.products.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                            controller.products.data['data']['products'].length,
                        itemBuilder: (BuildContext context, int index) {
                          Product product = Product.fromJson(controller
                              .products.data['data']['products'][index]);
                          return Container(
                            child: ProductItem(product: product),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 90,
                      padding: EdgeInsets.only(right: 15),
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 13.0),
                            child: Text(
                              '${controller.totalProducts.toString()} produtos',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: FloatingActionButton(
                                onPressed: () {},
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }
            },
          ),
        )
      ],
    );
  }
}
