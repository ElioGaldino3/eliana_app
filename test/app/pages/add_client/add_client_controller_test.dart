import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:eliana_app/app/pages/add_client/add_client_controller.dart';
import 'package:eliana_app/app/app_module.dart';

void main() {
  initModule(AppModule());
  AddClientController addclient;

  setUp(() {
    addclient = AppModule.to.get<AddClientController>();
  });

  group('AddClientController Test', () {
    test("First Test", () {
      expect(addclient, isInstanceOf<AddClientController>());
    });

    test("Set Value", () {
      expect(addclient.value, equals(0));
      addclient.increment();
      expect(addclient.value, equals(1));
    });
  });
}
