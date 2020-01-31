import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';

class AppRepository extends Disposable {
  final HasuraConnect connection;
  AppRepository(this.connection);

  ObservableStream getOrders() {
    var query = """
      subscription getOrders {
        orders(order_by: {dataDelivery: asc}, where: {isDelivery: {_eq: false}}) {
          id
          products
          dataDelivery
          client {
            id
            name
            phone
            photoUrl
          }
        }
      }
    """;

    Snapshot snapshot = connection.subscription(query);
    return snapshot.asObservable();
  }

  ObservableStream getProducts() {
    var query = """
      subscription getProdutos {
        products(order_by: {name: asc}) {
          id
          name
          value
          isRent
          photoUrl
        }
      }
    """;

    Snapshot snapshot = connection.subscription(query);
    return snapshot.asObservable();
  }

  ObservableStream getClients() {
    var query = """
      subscription getClients {
        clients(order_by: {name: asc}) {
          id
          name
          phone
          photoUrl
        }
      }
    """;

    Snapshot snapshot = connection.subscription(query);
    return snapshot.asObservable();
  }

  ObservableStream getRents() {
    var query = """
      subscription MyQuery {
        rents(where: {isFinished: {_eq: false}}, order_by: {dateRent: asc}) {
          id
          dateRent
          products
          client {
            id
            name
            phone
            photoUrl
          }
        }
      }
    """;

    Snapshot snapshot = connection.subscription(query);
    return snapshot.asObservable();
  }
  
    @override
  void dispose() {}
}
