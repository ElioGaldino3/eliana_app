import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:eliana_app/app/pages/home_view/home_view_page.dart';

main() {
  testWidgets('HomeViewPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(HomeViewPage(title: 'HomeView')));
    final titleFinder = find.text('HomeView');
    expect(titleFinder, findsOneWidget);
  });
}
