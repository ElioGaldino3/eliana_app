import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:eliana_app/app/pages/product_view/product_view_page.dart';

main() {
  testWidgets('ProductViewPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(ProductViewPage(title: 'ProductView')));
    final titleFinder = find.text('ProductView');
    expect(titleFinder, findsOneWidget);
  });
}
