import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:eliana_app/app/pages/orders/orders_controller.dart';
import 'package:eliana_app/app/app_module.dart';

void main() {
  initModule(AppModule());
  OrdersController orders;

  setUp(() {
    orders = AppModule.to.get<OrdersController>();
  });

  group('OrdersController Test', () {
    test("First Test", () {
      expect(orders, isInstanceOf<OrdersController>());
    });

    test("Set Value", () {
      expect(orders.value, equals(0));
      orders.increment();
      expect(orders.value, equals(1));
    });
  });
}
