import 'package:eliana_app/app/app_module.dart';
import 'package:eliana_app/app/app_repository.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
    return Scaffold(
      body: StreamBuilder<List<Order>>(
        stream: ordersOut,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data[index].client.name),
                subtitle: Text(snapshot.data[index].products),
              );
            },
          );
        },
      ),
    );
  }
}
