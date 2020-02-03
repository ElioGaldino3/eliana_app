import 'package:flutter/material.dart';

class ProductsCartPage extends StatefulWidget {
  final String title;
  const ProductsCartPage({Key key, this.title = "ProductsCart"})
      : super(key: key);

  @override
  _ProductsCartPageState createState() => _ProductsCartPageState();
}

class _ProductsCartPageState extends State<ProductsCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
