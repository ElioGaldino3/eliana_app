import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:eliana_app/app/modules/add_product/add_product_page.dart';

main() {
  testWidgets('AddProductPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(AddProductPage(title: 'AddProduct')));
    final titleFinder = find.text('AddProduct');
    expect(titleFinder, findsOneWidget);
  });
}
