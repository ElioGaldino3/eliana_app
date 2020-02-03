import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:intl/intl.dart';

@override
Future<Client> putClientOperation(
    Client client, HasuraConnect connection) async {
  var query = """
      mutation MyMutation {
        insert_clients(objects: {name: \"${client.name}\", phone: \"${client.phone}\", photoUrl: \"${client.photoUrl}\"}) {
          returning {
            id
            name
            phone
            photoUrl
          }
        }
      }  
    """;

  var data = await connection.mutation(query);
  return Client.fromJson(data['data']['insert_clients']['returning'][0]);
}

Future<Order> putOrderOperation(Order order, HasuraConnect connection) async {
  Map<String, dynamic> produtos = {
    "data" : order.productOrders
  };
  var query = r"""
      mutation putOrder($clientId: Int!, $productOrders: productOrder_arr_rel_insert_input!, $date: date!) {
      insert_orders(objects: {clientId: $clientId, dataDelivery: $date, productOrders: $productOrders,}) {
        returning {
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
    }   
    """;

  var data = await connection.mutation(query, variables: {
    "clientId": order.client.id,
    "productOrders": produtos,
    "date": DateFormat('yyyy-MM-dd').format(order.dataDelivery)
  });
  return Order.fromJson(data['data']['insert_orders']['returning'][0]);
}

Future<Product> putProductOperation(
    Product product, HasuraConnect connection) async {
  var query = """
      mutation putProdutos {
        insert_products(objects: {name: "${product.name}", value: ${product.value}, isRent: ${product.isRent}, photoUrl: "${product.photoUrl}"}) {
          returning {
            id
            name
            value
            isRent
            photoUrl
          }
        }
      }   
    """;

  var data = await connection.mutation(query);
  return Product.fromJson(data['data']['insert_products']['returning'][0]);
}

Future<Rent> putRentOperation(Rent rent, HasuraConnect connection) async {
  var query = """
      mutation MyMutation(\$idClient, \$dateRent, \$adress, \$productRents){
        insert_rents(objects: {idClient: \$idClient, dateRent: \$dateRent, adress: \$adress, productRents: {data: \$productRents}}) {
          returning{
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
      }  
    """;

  var data = await connection.mutation(query);
  return Rent.fromJson(data['data']['insert_rents']['returning'][0]);
}
