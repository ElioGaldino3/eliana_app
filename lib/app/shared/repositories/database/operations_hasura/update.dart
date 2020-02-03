import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/repositories/database/database_hasura.dart';
import 'package:hasura_connect/hasura_connect.dart';

Future<bool> updateClientOperation(Client client, HasuraConnect connection) async {
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
@override
Future<bool> updateProductOperation(Product product, HasuraConnect connection) async {
  var query = """
    mutation MyMutation(\$id, \$name, \$value, \$isRent, \$photoUrl){
      update_products(where: {id: {_eq: \$id}}, _set: {name: \$name, value: \$value, isRent: \$isRent, photoUrl: \$photoUrl}) {
        affected_rows
      }
    }
    """;
  var data = await connection.mutation(query, variables: {
    "id": product.id,
    "name": product.name,
    "value": product.value,
    "isRent": product.isRent,
    "photoUrl": product.photoUrl
  });
  return data['data']['update_products']['affected_rows'] >= 1;
}
