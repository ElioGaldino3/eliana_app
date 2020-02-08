import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_controller.g.dart';

class CalendarPageController = _CalendarBase with _$CalendarController;

abstract class _CalendarBase with Store {
  IDatabase _hasura = Modular.get();

  @observable
  ObservableStream rents;

  @observable
  ObservableStream orders;

  @observable
  CalendarController calendarController = CalendarController();

  _CalendarBase() {
    getStreams();
  }

  @action
  getStreams() {
    rents = _hasura.getStreamRents();
    orders = _hasura.getStreamOrders();
  }
}
