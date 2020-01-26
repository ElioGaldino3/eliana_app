import 'package:eliana_app/app/modules/home/home_controller.dart';
import 'package:eliana_app/app/modules/home/home_module.dart';
import 'package:eliana_app/app/pages/home_page_app/home_page_app_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = Inject<HomeModule>.of().get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (BuildContext context) {
          return PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller.controllerPage,
            children: <Widget>[
              HomePageAppPage(),
              Container(color: Colors.red),
              Container(color: Colors.blue),
              Container(color: Colors.green),
              Container(color: Colors.purple),
            ],
          );
        },
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          return BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Color.fromRGBO(106, 27, 154, 1),
            selectedItemColor: Color.fromRGBO(124, 77, 255, 1),
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.home)),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.birthdayCake)),
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.archive)),
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.boxes)),
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.users)),
            ],
            currentIndex: _controller.selectedIndex,
            onTap: _controller.changeIndexes,
          );
        },
      ),
    );
  }
}
