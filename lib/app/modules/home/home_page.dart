import 'package:eliana_app/app/modules/home/home_controller.dart';
import 'package:eliana_app/app/modules/home/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatelessWidget {
  HomeController controller = Inject<HomeModule>.of().get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (controller.orders.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Text(controller.orders.status == StreamStatus.active
                ? controller.orders.status.toString()
                : controller.orders.status.toString()),
          );
        }
      },
    );
  }
}
