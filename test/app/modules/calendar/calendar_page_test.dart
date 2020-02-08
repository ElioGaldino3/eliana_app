import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:eliana_app/app/modules/calendar/calendar_page.dart';

main() {
  testWidgets('CalendarPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(CalendarPage(title: 'Calendar')));
    final titleFinder = find.text('Calendar');
    expect(titleFinder, findsOneWidget);
  });
}
