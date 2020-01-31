import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:eliana_app/app/pages/clients/clients_page.dart';

main() {
  testWidgets('ClientsPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ClientsPage(title: 'Clients')));
    final titleFinder = find.text('Clients');
    expect(titleFinder, findsOneWidget);
  });
}
