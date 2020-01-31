import 'package:eliana_app/app/pages/rents/rents_controller.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:eliana_app/app/shared/widgets/item_rent.dart';
import 'package:eliana_app/app/shared/widgets/title_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app_module.dart';

class RentsPage extends StatefulWidget {
  final String title;
  const RentsPage({Key key, this.title = "Rents"}) : super(key: key);

  @override
  _RentsPageState createState() => _RentsPageState();
}

class _RentsPageState extends State<RentsPage> {
  @override
  Widget build(BuildContext context) {
    RentsController controller = Inject<AppModule>.of().get();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TitlePage(title: "Aluguéis"),
        Expanded(
          child: Observer(
            builder: (_) {
              if (controller.rents.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                            controller.rents.data['data']['rents'].length,
                        itemBuilder: (BuildContext context, int index) {
                          Rent rent = Rent.fromJson(
                              controller.rents.data['data']['rents'][index]);
                          return Container(
                            child: RentItem(rent: rent),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 90,
                      padding: EdgeInsets.only(right: 15),
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Observer(
                            builder: (_) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 13.0),
                                child: Text(
                                  '${controller.totalRents.toString()} aluguéis',
                                  style: TextStyle(fontSize: 18),
                                ),
                              );
                            },
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: FloatingActionButton(
                                onPressed: () {},
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }
            },
          ),
        )
      ],
    );
  }
}
