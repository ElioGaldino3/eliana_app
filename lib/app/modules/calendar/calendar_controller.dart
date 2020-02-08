import 'package:mobx/mobx.dart';

part 'calendar_controller.g.dart';

class CalendarController = _CalendarBase with _$CalendarController;

abstract class _CalendarBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
