import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:hasura_connect/hasura_connect.dart';

  Future<Client> getClientOperation(int id, HasuraConnect connection) async {
    var query = """
    query getClient(\$id){
      clients(where: {id: {_eq: \$id}}) {
        id
        name
        phone
        photoUrl
      }
    }
    """;

    var data = await connection.query(query, variables: {
      "id": id,
    });

    return Client.fromJson(data['data']['clients'][0]);
  }

  Future<Order> getOrderOperation(int id, HasuraConnect connection) async {
    var query = """
    query getOrder(\$id){
      orders(where: {id: {_eq: \$id}}) {
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

    var data = await connection.query(query, variables: {
      "id": id,
    });

    return Order.fromJson(data['data']['orders'][0]);
  }

  Future<Product> getProductOperation(int id, HasuraConnect connection) async {
    var query = """
    query getProduto(\$id:Int!){
      products(where: {id: {_eq: \$id}}) {
        id
        name
        value
        isRent
        photoUrl
      }
    }
    """;

    var data = await connection.query(query, variables: {
      "id": id,
    });

    return Product.fromJson(data['data']['products'][0]);
  }

  Future<Rent> getRentOperation(int id, HasuraConnect connection) async {
    var query = """
    query getRent(\$id){
      rents(where: {id: {_eq: \$id}}) {
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

    var data = await connection.query(query, variables: {
      "id": id,
    });

    return Rent.fromJson(data['data']['rents'][0]);
  }
