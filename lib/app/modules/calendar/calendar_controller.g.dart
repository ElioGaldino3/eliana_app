// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalendarPageController on _CalendarBase, Store {
  final _$rentsAtom = Atom(name: '_CalendarBase.rents');

  @override
  ObservableStream<dynamic> get rents {
    _$rentsAtom.context.enforceReadPolicy(_$rentsAtom);
    _$rentsAtom.reportObserved();
    return super.rents;
  }

  @override
  set rents(ObservableStream<dynamic> value) {
    _$rentsAtom.context.conditionallyRunInAction(() {
      super.rents = value;
      _$rentsAtom.reportChanged();
    }, _$rentsAtom, name: '${_$rentsAtom.name}_set');
  }

  final _$ordersAtom = Atom(name: '_CalendarBase.orders');

  @override
  ObservableStream<dynamic> get orders {
    _$ordersAtom.context.enforceReadPolicy(_$ordersAtom);
    _$ordersAtom.reportObserved();
    return super.orders;
  }

  @override
  set orders(ObservableStream<dynamic> value) {
    _$ordersAtom.context.conditionallyRunInAction(() {
      super.orders = value;
      _$ordersAtom.reportChanged();
    }, _$ordersAtom, name: '${_$ordersAtom.name}_set');
  }

  final _$calendarControllerAtom =
      Atom(name: '_CalendarBase.calendarController');

  @override
  CalendarController get calendarController {
    _$calendarControllerAtom.context
        .enforceReadPolicy(_$calendarControllerAtom);
    _$calendarControllerAtom.reportObserved();
    return super.calendarController;
  }

  @override
  set calendarController(CalendarController value) {
    _$calendarControllerAtom.context.conditionallyRunInAction(() {
      super.calendarController = value;
      _$calendarControllerAtom.reportChanged();
    }, _$calendarControllerAtom, name: '${_$calendarControllerAtom.name}_set');
  }

  final _$_CalendarBaseActionController =
      ActionController(name: '_CalendarBase');

  @override
  dynamic getStreams() {
    final _$actionInfo = _$_CalendarBaseActionController.startAction();
    try {
      return super.getStreams();
    } finally {
      _$_CalendarBaseActionController.endAction(_$actionInfo);
    }
  }
}
