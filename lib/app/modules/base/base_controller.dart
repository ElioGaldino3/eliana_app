import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'base_controller.g.dart';

class BaseController = _BaseBase with _$BaseController;

abstract class _BaseBase with Store {
  @observable
  PageController pageController = PageController(initialPage: 0);

  @observable
  int currentPage = 0;

  @action
  void changePage(int page) {
    pageController.jumpToPage(page);
    currentPage = page;
  }
}
