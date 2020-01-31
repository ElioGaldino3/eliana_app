import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:eliana_app/app/pages/products/products_controller.dart';
import 'package:eliana_app/app/app_module.dart';

void main() {
  initModule(AppModule());
  ProductsController products;

  setUp(() {
    products = AppModule.to.get<ProductsController>();
  });

  group('ProductsController Test', () {
    test("First Test", () {
      expect(products, isInstanceOf<ProductsController>());
    });

    test("Set Value", () {
      expect(products.value, equals(0));
      products.increment();
      expect(products.value, equals(1));
    });
  });
}
