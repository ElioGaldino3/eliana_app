import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:eliana_app/app/pages/home_page_app/home_page_app_page.dart';

main() {
  testWidgets('HomePageAppPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(HomePageAppPage(title: 'HomePageApp')));
    final titleFinder = find.text('HomePageApp');
    expect(titleFinder, findsOneWidget);
  });
}
