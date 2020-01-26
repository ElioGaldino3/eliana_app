import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:eliana_app/app/pages/home_page_app/home_page_app_controller.dart';
import 'package:eliana_app/app/app_module.dart';

void main() {
  initModule(AppModule());
  HomePageAppController homepageapp;

  setUp(() {
    homepageapp = AppModule.to.get<HomePageAppController>();
  });

  group('HomePageAppController Test', () {
    test("First Test", () {
      expect(homepageapp, isInstanceOf<HomePageAppController>());
    });

    test("Set Value", () {
      expect(homepageapp.value, equals(0));
      homepageapp.increment();
      expect(homepageapp.value, equals(1));
    });
  });
}
