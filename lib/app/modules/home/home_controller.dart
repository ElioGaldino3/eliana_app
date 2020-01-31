import 'package:eliana_app/app/pages/init/init_page.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  @observable
  Widget currentPage = InitPage();

  @action
  changePage(Widget page) {
    currentPage = page;
  }
}
