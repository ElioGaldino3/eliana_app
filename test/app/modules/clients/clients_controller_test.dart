import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:eliana_app/app/modules/clients/clients_controller.dart';
import 'package:eliana_app/app/modules/clients/clients_module.dart';

void main() {
  initModule(ClientsModule());
  ClientsController clients;

  setUp(() {
    clients = ClientsModule.to.get<ClientsController>();
  });

  group('ClientsController Test', () {
    test("First Test", () {
      expect(clients, isInstanceOf<ClientsController>());
    });

    test("Set Value", () {
      expect(clients.value, equals(0));
      clients.increment();
      expect(clients.value, equals(1));
    });
  });
}
