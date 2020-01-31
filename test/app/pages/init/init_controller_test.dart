import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:eliana_app/app/pages/init/init_controller.dart';
import 'package:eliana_app/app/app_module.dart';

void main() {
  initModule(AppModule());
  InitController init;

  setUp(() {
    init = AppModule.to.get<InitController>();
  });

  group('InitController Test', () {
    test("First Test", () {
      expect(init, isInstanceOf<InitController>());
    });

    test("Set Value", () {
      expect(init.value, equals(0));
      init.increment();
      expect(init.value, equals(1));
    });
  });
}
