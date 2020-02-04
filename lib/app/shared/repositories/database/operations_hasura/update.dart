import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:hasura_connect/hasura_connect.dart';

Future<bool> updateClientOperation(
    Client client, HasuraConnect connection) async {
  var query = """
    mutation MyMutation{
      update_clients(where: {id: {_eq: ${client.id}}}, _set: {name: \"${client.name}\", phone: \"${client.phone}\", photoUrl: \"${client.photoUrl}\"}) {
        affected_rows
      }
    }
    """;
  var data = await connection.mutation(query);
  return data['data']['update_clients']['affected_rows'] >= 1;
}

Future<bool> updateProductOperation(
    Product product, HasuraConnect connection) async {
  var query = r"""
    mutation MyMutation($id: Int!, $name: String!, $value: float8!, $isRent: Boolean!, $photoUrl: String!){
      update_products(where: {id: {_eq: $id}}, _set: {name: $name, value: $value, isRent: $isRent, photoUrl: $photoUrl}) {
        affected_rows
      }
    }
    """;
  var data = await connection.mutation(query, variables: {
    "id": product.id,
    "name": product.name,
    "value": product.value,
    "isRent": product.isRent ?? false,
    "photoUrl": product.photoUrl
  });
  return data['data']['update_products']['affected_rows'] >= 1;
}

Future<bool> updateOrderOperation(
    Order order, HasuraConnect connection) async {
  var query = r"""
    mutation MyMutation($id: Int!, $name: String!, $value: float8!, $isRent: Boolean!, $photoUrl: String!){
      update_products(where: {id: {_eq: $id}}, _set: {name: $name, value: $value, isRent: $isRent, photoUrl: $photoUrl}) {
        affected_rows
      }
    }
    """;
  var data = await connection.mutation(query);
  return data['data']['update_products']['affected_rows'] >= 1;
}

Future<bool> updateRentOperation(
    Rent rent, HasuraConnect connection) async {
  var query = r"""
    mutation MyMutation($id: Int!, $name: String!, $value: float8!, $isRent: Boolean!, $photoUrl: String!){
      update_products(where: {id: {_eq: $id}}, _set: {name: $name, value: $value, isRent: $isRent, photoUrl: $photoUrl}) {
        affected_rows
      }
    }
    """;
  var data = await connection.mutation(query);
  return data['data']['update_products']['affected_rows'] >= 1;
}
