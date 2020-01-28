import 'package:eliana_app/app/app_module.dart';
import 'package:eliana_app/app/app_repository.dart';
import 'package:eliana_app/app/pages/product_view/product_view_controller.dart';
import 'package:eliana_app/app/pages/product_view/product_view_module.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductViewPage extends StatefulWidget {
  @override
  _ProductViewPageState createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  AppRepository repo = AppModule.to.get<AppRepository>();
  Stream<List<Product>> productsOut;
  final ProductViewController productController = Inject<AppModule>.of().get();
  @override
  void initState() {
    super.initState();

    productsOut = repo.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration.zero,
        () => setState(() {
              productController.changeTotal(0);
            }));
    double screenHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: screenHeight,
            color: Colors.deepPurple,
          ),
          Container(
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                child: Text(
                  'Produtos',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                padding: EdgeInsets.only(left: 18),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Product>>(
              stream: productsOut,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    productController.changeTotal(snapshot.data.length);
                    return Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: ProductItem(
                          data: snapshot.data[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(height: 95, color: Colors.white),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Modular.to.pushNamed('/add-product/');
        },
      ),
    );
  }
}
