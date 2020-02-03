import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:hasura_connect/hasura_connect.dart';

Future<List<Client>> getClientsOperation(HasuraConnect connection) async {
  var query = """
      query getClients {
        clients(order_by: {name: asc}) {
          id
          name
          phone
          photoUrl
        }
      }
    """;

  var data = await connection.query(query);
  List<Client> clients = List<Client>();
  for (var item in data['data']['clients']) {
    Client client = Client.fromJson(item);

    clients.add(client);
  }
  return clients;
}

Future<List<Order>> getOrdersOperation(HasuraConnect connection) async {
  var query = """
      query getOrder {
        orders(order_by: {dataDelivery: asc}) {
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

  var data = await connection.query(query);
  List<Order> orders = List<Order>();
  for (var item in data['data']['orders']) {
    Order order = Order.fromJson(item);

    orders.add(order);
  }
  return orders;
}

Future<List<Product>> getProductsOperation(HasuraConnect connection) async {
  var query = """
      query getProducts {
        products(order_by: {name: asc}) {
          id
          name
          value
          isRent
          photoUrl
        }
      }
    """;

  var data = await connection.query(query);
  List<Product> products = List<Product>();
  for (var item in data['data']['products']) {
    Product product = Product.fromJson(item);

    products.add(product);
  }
  return products;
}

Future<List<Rent>> getRentsOperation(HasuraConnect connection) async {
  var query = """
      query getRents {
        rents(order_by: {name: asc}) {
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

  var data = await connection.query(query);
  List<Rent> rents = List<Rent>();
  for (var item in data['data']['rents']) {
    Rent rent = Rent.fromJson(item);

    rents.add(rent);
  }
  return rents;
}
