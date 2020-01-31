import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:eliana_app/app/pages/products/products_page.dart';

main() {
  testWidgets('ProductsPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(ProductsPage(title: 'Products')));
    final titleFinder = find.text('Products');
    expect(titleFinder, findsOneWidget);
  });
}
