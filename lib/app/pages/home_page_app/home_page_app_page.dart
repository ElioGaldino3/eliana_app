import 'package:flutter/material.dart';

class HomePageAppPage extends StatefulWidget {
  final String title;
  const HomePageAppPage({Key key, this.title = "HomePageApp"})
      : super(key: key);

  @override
  _HomePageAppPageState createState() => _HomePageAppPageState();
}

class _HomePageAppPageState extends State<HomePageAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: CircularProgressIndicator(),)
        ],
      ),
    );
  }
}
