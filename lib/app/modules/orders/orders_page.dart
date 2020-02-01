import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  final String title;
  const OrdersPage({Key key, this.title = "Encomendas"}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
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
