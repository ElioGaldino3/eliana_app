import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:eliana_app/app/pages/home_view/home_view_controller.dart';
import 'package:eliana_app/app/pages/home_view/home_view_module.dart';

void main() {
  initModule(HomeViewModule());
  HomeViewController homeview;

  setUp(() {
    homeview = HomeViewModule.to.get<HomeViewController>();
  });

  group('HomeViewController Test', () {
    test("First Test", () {
      expect(homeview, isInstanceOf<HomeViewController>());
    });

    test("Set Value", () {
      expect(homeview.value, equals(0));
      homeview.increment();
      expect(homeview.value, equals(1));
    });
  });
}
