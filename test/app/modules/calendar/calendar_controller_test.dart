import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:eliana_app/app/modules/calendar/calendar_controller.dart';
import 'package:eliana_app/app/app_module.dart';

void main() {
  initModule(AppModule());
  CalendarController calendar;

  setUp(() {
    calendar = AppModule.to.get<CalendarController>();
  });

  group('CalendarController Test', () {
    test("First Test", () {
      expect(calendar, isInstanceOf<CalendarController>());
    });

    test("Set Value", () {
      expect(calendar.value, equals(0));
      calendar.increment();
      expect(calendar.value, equals(1));
    });
  });
}
