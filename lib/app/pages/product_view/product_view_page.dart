import 'package:flutter/material.dart';

class ProductViewPage extends StatefulWidget {
  final String title;
  const ProductViewPage({Key key, this.title = "ProductView"})
      : super(key: key);

  @override
  _ProductViewPageState createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
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
