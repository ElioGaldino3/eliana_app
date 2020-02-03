import 'package:eliana_app/app/modules/rents/rents_controller.dart';
import 'package:eliana_app/app/shared/widgets/Items/builds_list/build_list_rents.dart';
import 'package:eliana_app/app/shared/widgets/custom_drawer/custom_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Observer(
              builder: (_) {
                if (controller.rents.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return BuildListRents(
                    listStream: controller.rents.data['data']['rents'],
                    controller: controller,
                  );
                }
              },
            ),
          ),
          Container(
            height: 90,
            color: Colors.grey[200],
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 23.0),
                child: Observer(builder: (_) {
                  return Text(
                    "${controller.total} aluguéis",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  );
                }),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.plus),
        onPressed: () {},
      ),
    );
  }
}
