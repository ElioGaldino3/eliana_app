import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:hasura_connect/hasura_connect.dart';

Future<bool> deliveredOrderOperation(
    Order order, HasuraConnect connection) async {
  var query = """
    mutation deliveredOrder(\$id){
      update_orders(where: {id: {_eq: \$id}}, _set: {isDelivery: true}) {
        affected_rows
      }
    }
    """;
  var data = await connection.mutation(query, variables: {"id": order.id});
  return data['data']['update_orders']['affected_rows'] >= 1;
}

Future<bool> deliveredRentOperation(Rent rent, HasuraConnect connection) async {
  var query = """
    mutation deliveredRent(\$id){
      update_rents(where: {id: {_eq: \$id}}, _set: {isFinished: true}) {
        affected_rows
      }
    }
    """;
  var data = await connection.mutation(query, variables: {"id": rent.id});
  return data['data']['update_rents']['affected_rows'] >= 1;
}
