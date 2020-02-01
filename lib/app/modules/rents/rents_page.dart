import 'package:eliana_app/app/modules/rents/rents_controller.dart';
import 'package:eliana_app/app/shared/widgets/custom_drawer/custom_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RentsPage extends StatefulWidget {
  @override
  _RentsPageState createState() => _RentsPageState();
}

class _RentsPageState extends State<RentsPage> {
  @override
  Widget build(BuildContext context) {
    RentsController rentsController = Modular.get();
    return Scaffold(
      appBar: AppBar(
        title: Text("Aluguéis"),
      ),
      body: Center(
        child: Text("Você está na página de aluguéis!"),
      ),
      drawer: CustomDrawerWidget(),
    );
  }
}
