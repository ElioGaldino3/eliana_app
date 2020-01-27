import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:eliana_app/app/pages/product_view/product_view_controller.dart';
import 'package:eliana_app/app/pages/product_view/product_view_module.dart';

void main() {
  initModule(ProductViewModule());
  ProductViewController productview;

  setUp(() {
    productview = ProductViewModule.to.get<ProductViewController>();
  });

  group('ProductViewController Test', () {
    test("First Test", () {
      expect(productview, isInstanceOf<ProductViewController>());
    });

    test("Set Value", () {
      expect(productview.value, equals(0));
      productview.increment();
      expect(productview.value, equals(1));
    });
  });
}
