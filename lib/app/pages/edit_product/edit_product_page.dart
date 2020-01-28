import 'package:eliana_app/app/shared/models/product.dart';
import 'package:flutter/material.dart';

import '../../app_module.dart';
import '../../app_repository.dart';

class EditProductPage extends StatefulWidget {
  final String title;
  final int id;
  const EditProductPage({this.id, Key key, this.title = "EditProduct"})
      : super(key: key);

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  AppRepository repo = AppModule.to.get<AppRepository>();
  @override
  Widget build(BuildContext context) {
    var product = repo.getProduct(widget.id);
    print(product);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id.toString()),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
