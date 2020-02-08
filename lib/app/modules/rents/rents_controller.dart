import 'package:eliana_app/app/modules/calendar/calendar_controller.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'rents_controller.g.dart';

class RentsController = _RentsBase with _$RentsController;

abstract class _RentsBase with Store {
  IDatabase _hasura = Modular.get();
  CalendarPageController calendarController = Modular.get();

  @computed
  int get total => calendarController.rents.data == null
      ? 0
      : calendarController.rents.data['data']['rents'].length;

  @action
  deleteRent(int id) {
    _hasura.deleteRent(id);
  }

  @action
  deliveredRent(int id) {
    _hasura.deliveredRent(Rent(id: id));
  }
}
