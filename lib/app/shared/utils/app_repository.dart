import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';

class AppRepository extends Disposable {
  final HasuraConnect connection;
  AppRepository(this.connection);

  ObservableStream getOrders() {
    var query = """
      subscription MySubscription {
        orders(order_by: {deliveryDate: asc}, where: {isDelivery: {_eq: false}}) {
          id
          products
          deliveryDate
          isDelivery
          client {
            name
          }
        }
      }
    """;

    Snapshot snapshot = connection.subscription(query);
    return snapshot.asObservable();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
