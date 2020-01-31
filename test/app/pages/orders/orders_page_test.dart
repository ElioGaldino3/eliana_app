import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:eliana_app/app/pages/orders/orders_page.dart';

main() {
  testWidgets('OrdersPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(OrdersPage(title: 'Orders')));
    final titleFinder = find.text('Orders');
    expect(titleFinder, findsOneWidget);
  });
}
