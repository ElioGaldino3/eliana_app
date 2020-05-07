import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:hasura_connect/hasura_connect.dart';

Stream<List<Client>> getStreamClientsOperation(HasuraConnect connection) {
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

  return connection.subscription(query).map((json) => Client.fromJsonList(json["data"]["clients"]));
}

Stream<List<Order>> getStreamOrdersOperation(HasuraConnect connection) {
  var query = """
      subscription MySubscription {
        orders(order_by: {dataDelivery: asc}, where: {isDelivery: {_eq: false}}) {
          id
            dataDelivery
            comment
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
  return connection.subscription(query).map((json) => Order.fromJsonList(json["data"]["orders"]));
}

Stream<List<Product>> getStreamProductsOperation(HasuraConnect connection) {
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

  return connection.subscription(query).map((json) => Product.fromJsonList(json["data"]["products"]));
}

Stream<List<Rent>> getStreamRentsOperation(HasuraConnect connection) {
  var query = r"""
      subscription getRents {
        rents(order_by: {dateRent: asc}, where: {isFinished: {_eq: false}}) {
          id
            dateRent
            adress
            comment
            productRents {
              productId
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

  return connection.subscription(query).map((json) => Rent.fromJsonList(json["data"]["rents"]));
}
