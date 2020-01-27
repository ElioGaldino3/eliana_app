import 'package:eliana_app/app/shared/models/order.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

class AppRepository extends Disposable {
  final HasuraConnect connection;
  AppRepository(this.connection);

  Stream<List<Order>> getOrders() {
    var doc = """
      subscription getOrders {
        orders {
          id
          products
          dateTime
          delivered
          client {
            id
            name
            phone
            photoUrl
          }
        }
      }
    """;
    Snapshot snapshot = connection.subscription(doc);
    snapshot.map((jsonList) => Order.fromJsonList(jsonList['data']['orders']));
  }

  @override
  void dispose() {}
}
