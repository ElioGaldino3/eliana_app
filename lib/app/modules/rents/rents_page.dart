import 'package:eliana_app/app/shared/widgets/custom_drawer/custom_drawer_widget.dart';
import 'package:flutter/material.dart';

class RentsPage extends StatefulWidget {
  final String title;
  const RentsPage({Key key, this.title = "Aluguéis"}) : super(key: key);

  @override
  _RentsPageState createState() => _RentsPageState();
}

class _RentsPageState extends State<RentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
      drawer: CustomDrawerWidget(),
    );
  }
}
