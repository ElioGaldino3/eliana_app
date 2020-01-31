import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:eliana_app/app/pages/init/init_page.dart';

main() {
  testWidgets('InitPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(InitPage(title: 'Init')));
    final titleFinder = find.text('Init');
    expect(titleFinder, findsOneWidget);
  });
}
