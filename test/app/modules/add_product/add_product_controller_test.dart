import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:eliana_app/app/modules/add_product/add_product_controller.dart';
import 'package:eliana_app/app/modules/add_product/add_product_module.dart';

void main() {
  initModule(AddProductModule());
  AddProductController addproduct;

  setUp(() {
    addproduct = AddProductModule.to.get<AddProductController>();
  });

  group('AddProductController Test', () {
    test("First Test", () {
      expect(addproduct, isInstanceOf<AddProductController>());
    });

    test("Set Value", () {
      expect(addproduct.value, equals(0));
      addproduct.increment();
      expect(addproduct.value, equals(1));
    });
  });
}
