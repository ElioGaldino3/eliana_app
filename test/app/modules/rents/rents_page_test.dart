import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:eliana_app/app/modules/rents/rents_page.dart';

main() {
  testWidgets('RentsPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(RentsPage(title: 'Rents')));
    final titleFinder = find.text('Rents');
    expect(titleFinder, findsOneWidget);
  });
}
