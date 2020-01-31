import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:eliana_app/app/pages/add_client/add_client_page.dart';

main() {
  testWidgets('AddClientPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(AddClientPage(title: 'AddClient')));
    final titleFinder = find.text('AddClient');
    expect(titleFinder, findsOneWidget);
  });
}
