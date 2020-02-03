import 'package:hasura_connect/hasura_connect.dart';

Future<bool> deleteClientOperation(int id, HasuraConnect connection) async {
  String query = """
      mutation MyMutation{
        delete_clients(where: {id: {_eq: $id}}) {
          affected_rows
        }
      }
    """;

  var data = await connection.mutation(query);
  return data['data']['delete_clients']['affected_rows'] >= 1;
}

Future<bool> deleteOrderOperation(int id, HasuraConnect connection) async {
  String query = """
      mutation MyMutation{
        delete_orders(where: {id: {_eq: $id}}) {
          affected_rows
        }
      }
    """;

  var data = await connection.mutation(query);
  return data['data']['delete_orders']['affected_rows'] >= 1;
}

Future<bool> deleteProductOperation(int id, HasuraConnect connection) async {
  String query = """
      mutation MyMutation{
        delete_products(where: {id: {_eq: $id}}) {
          affected_rows
        }
      }
    """;

  var data = await connection.mutation(query, variables: {"id": id});
  return data['data']['delete_products']['affected_rows'] >= 1;
}

Future<bool> deleteRentOperation(int id, HasuraConnect connection) async {
  String query = """
      mutation MyMutation{
        delete_rents(where: {id: {_eq: $id}}) {
          affected_rows
        }
      }
    """;

  var data = await connection.mutation(query, variables: {"id": id});
  return data['data']['delete_rents']['affected_rows'] >= 1;
}
