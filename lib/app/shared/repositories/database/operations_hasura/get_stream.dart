import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';

ObservableStream getStreamClientsOperation(HasuraConnect connection) {
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

ObservableStream getStreamOrdersOperation(HasuraConnect connection) {
  var query = """
      subscription MySubscription {
        orders(order_by: {dataDelivery: asc}, where: {isDelivery: {_eq: false}}) {
          id
          dataDelivery
          productOrders {
            idProduct
            amount
          }
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

ObservableStream getStreamProductsOperation(HasuraConnect connection) {
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

ObservableStream getStreamRentsOperation(HasuraConnect connection) {
  var query = """
      subscription MySubscription {
        rents(order_by: {dateRent: asc}, where: {isFinished: {_eq: false}}) {
          id
          dateRent
          productRents {
            id
            amount
          }
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
