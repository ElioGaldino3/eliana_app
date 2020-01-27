import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

class AppRepository extends Disposable {
  final HasuraConnect connection;
  AppRepository(this.connection);

  Stream<List<Order>> getOrders() {
    var doc = """
      subscription getOrders {
        orders(order_by: {dateTime: asc}){
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
    return snapshot
        .map((jsonList) => Order.fromJsonList(jsonList['data']['orders']));
  }

  Stream<List<Product>> getProducts() {
    var doc = """
      subscription getProducts {
        products(order_by: {name: asc}) {
          id
          name
          value
          photoUrl
          isRent
        }
      }
    """;
    Snapshot snapshot = connection.subscription(doc);
    return snapshot
        .map((jsonList) => Product.fromJsonList(jsonList['data']['products']));
  }

  Future<Product> getProduct(int id) {
    var doc = """
      query getProduct(\$id:Int!) {
        products(where: {id: {_eq: \id}}) {
          name
          value
          photoUrl
          isRent
        }
      }
    """;
    print("Prinando o conection query:");
    print(connection.query(doc));
  }

  @override
  void dispose() {}
}
