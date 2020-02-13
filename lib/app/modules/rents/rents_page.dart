import 'package:eliana_app/app/modules/rents/rents_controller.dart';
import 'package:eliana_app/app/shared/widgets/Items/builds_list/build_list_rents.dart';
import 'package:eliana_app/app/shared/widgets/custom_drawer/custom_drawer_widget.dart';
import 'package:eliana_app/app/shared/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';

class RentsPage extends StatefulWidget {
  @override
  _RentsPageState createState() => _RentsPageState();
}

class _RentsPageState extends State<RentsPage> {
  RentsController controller = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawerWidget(),
      appBar: AppBar(
        title: Text("Aluguéis"),
      ),
      body: Observer(
        builder: (_) {
          if (controller.rents.status == StreamStatus.waiting)
            return Center(child: LoadingAnimation());
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: BuildListRents(
                  listStream: controller.rents.data['data']['rents'],
                ),
              ),
              Container(
                height: 90,
                color: Colors.purple[700],
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 23.0),
                    child: Text(
                      "${controller.total} aluguéis",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.plus),
        onPressed: () {
          Modular.to.pushNamed("/add-rent/");
        },
      ),
    );
  }
}
