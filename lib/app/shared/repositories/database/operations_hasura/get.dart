import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:eliana_app/app/shared/models/user.dart';
import 'package:hasura_connect/hasura_connect.dart';

Future<Client> getClientOperation(int id, HasuraConnect connection) async {
  var query = r"""
    query getClient($id: Int!){
      clients(where: {id: {_eq: $id}}) {
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
  var query = r"""
    query getOrder($id: Int!){
      orders(where: {id: {_eq: $id}}) {
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

  var data = await connection.query(query, variables: {
    "id": id,
  });

  return Order.fromJson(data['data']['orders'][0]);
}

Future<Product> getProductOperation(int id, HasuraConnect connection) async {
  var query = r"""
    query getProduto($id: Int!){
      products(where: {id: {_eq: $id}}) {
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
  var query = r"""
    query getRent($id: Int!){
      rents(where: {id: {_eq: $id}}) {
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

  var data = await connection.query(query, variables: {
    "id": id,
  });

  return Rent.fromJson(data['data']['rents'][0]);
}

Future<User> getUserOperation(String uid, HasuraConnect connection) async {
  var query = r"""
      query getUser($uid: String!) {
        users(where: {uid: {_eq: $uid}}) {
          id
          uid
          isUser
          isAdmin
        }
      }
    """;

  var data = await connection.query(query, variables: {"uid": uid});
  var json = data['data']['users'];
  if (json == null || json.isEmpty) {
    return null;
  } else {
    return User.fromJson(data['data']['users'][0]);
  }
}
