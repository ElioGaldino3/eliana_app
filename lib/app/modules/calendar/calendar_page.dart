import 'package:eliana_app/app/modules/calendar/calendar_controller.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:eliana_app/app/shared/widgets/custom_drawer/custom_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarPageController controller = Modular.get();
  Map<DateTime, List<dynamic>> events = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendário"),
      ),
      body: Observer(
        builder: (_) {
          if (controller.orders.status == StreamStatus.waiting ||
              controller.orders.status == StreamStatus.waiting)
            Center(
              child: CircularProgressIndicator(),
            );
          for (var item in controller.orders.data['data']['orders']) {
            Order order = Order.fromJson(item);
            events.map<DateTime, List<dynamic>>((key, value) {
              if (key == order.dataDelivery) {
                value.add(order.client.name);
                return MapEntry(order.dataDelivery, value);
              } else {
                return MapEntry(order.dataDelivery, value);
              }
            });
          }
          for (var item in controller.rents.data['data']['rents']) {
            Rent rent = Rent.fromJson(item);
            events.addAll({
              rent.dateRent: [rent.client.name]
            });
          }
          return Column(
            children: <Widget>[
              TableCalendar(
                calendarController: controller.calendarController,
                locale: "pt-BR",
                events: events,
              )
            ],
          );
        },
      ),
      drawer: CustomDrawerWidget(),
    );
  }
}
