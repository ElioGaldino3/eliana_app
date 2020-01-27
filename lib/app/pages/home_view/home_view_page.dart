import 'package:eliana_app/app/app_module.dart';
import 'package:eliana_app/app/app_repository.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/widgets/order_item.dart';
import 'package:flutter/material.dart';

class HomeViewPage extends StatefulWidget {
  final String title;
  const HomeViewPage({Key key, this.title = "HomeView"}) : super(key: key);

  @override
  _HomeViewPageState createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  AppRepository repo = AppModule.to.get<AppRepository>();
  Stream<List<Order>> ordersOut;

  @override
  void initState() {
    super.initState();

    ordersOut = repo.getOrders();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          height: screenHeight,
          color: Colors.deepPurple,
        ),
        Container(
          height: 60,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              child: Text(
                'Início',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              padding: EdgeInsets.only(left: 18),
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder<List<Order>>(
            stream: ordersOut,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: OrderItem(data: snapshot.data[index],),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    ));
  }
}
