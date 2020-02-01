import 'package:flutter/material.dart';

class AddClientPage extends StatefulWidget {
  final String title;
  const AddClientPage({Key key, this.title = "AddClient"}) : super(key: key);

  @override
  _AddClientPageState createState() => _AddClientPageState();
}

class _AddClientPageState extends State<AddClientPage> {
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
