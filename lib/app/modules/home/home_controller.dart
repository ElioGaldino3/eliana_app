import 'package:eliana_app/app/modules/home/home_module.dart';
import 'package:eliana_app/app/pages/init/init_page.dart';
import 'package:eliana_app/app/shared/utils/app_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  AppRepository repo = Inject<HomeModule>.of().get();

  @observable
  ObservableStream orders;

  _HomeBase() {
    orders = repo.getOrders();
  }

  @observable
  Widget currentPage = InitPage();

  @action
  changePage(Widget page) {
    currentPage = page;
  }
}
