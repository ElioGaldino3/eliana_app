import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:eliana_app/app/pages/rents/rents_controller.dart';
import 'package:eliana_app/app/app_module.dart';

void main() {
  initModule(AppModule());
  RentsController rents;

  setUp(() {
    rents = AppModule.to.get<RentsController>();
  });

  group('RentsController Test', () {
    test("First Test", () {
      expect(rents, isInstanceOf<RentsController>());
    });

    test("Set Value", () {
      expect(rents.value, equals(0));
      rents.increment();
      expect(rents.value, equals(1));
    });
  });
}
