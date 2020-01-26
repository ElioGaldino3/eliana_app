import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  @observable
  int selectedIndex = 0;

  @observable
  PageController controllerPage = PageController(initialPage: 0);

  @action
  changeIndexes(int index) {
    selectedIndex = index;
    controllerPage.animateToPage(index, duration: Duration(milliseconds: 380),curve: Curves.decelerate);
  }
}
