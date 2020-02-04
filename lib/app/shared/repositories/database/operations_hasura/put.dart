import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:intl/intl.dart';

@override
Future<Client> putClientOperation(
    Client client, HasuraConnect connection) async {
  var query = r"""
      mutation putClient($name: String!, $phone: String!, $photoUrl: String!){
        insert_clients(objects: {name: $name, phone: $phone, photoUrl: $photoUrl}) {
          returning {
            id
            name
            phone
            photoUrl
          }
        }
      } 
    """;

  var data = await connection.mutation(query, variables: {
    "name": client.name,
    "phone": client.phone ?? "",
    "photoUrl": client.photoUrl ?? ""
  });
  return Client.fromJson(data['data']['insert_clients']['returning'][0]);
}

Future<Order> putOrderOperation(Order order, HasuraConnect connection) async {
  Map<String, dynamic> produtos = {"data": order.productOrders};
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
  var query = r"""
      mutation putProdutos($name: String!, $value: float8!, $isRent: Boolean!, $photoUrl: String!){
        insert_products(objects: {name: $name, value: $value, isRent: $isRent, photoUrl: $photoUrl}) {
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

  var data = await connection.mutation(query, variables: {
    "name": product.name,
    "value": product.value ?? 0.0,
    "photoUrl": product.photoUrl ?? "",
    "isRent": product.isRent ?? false
  });
  return Product.fromJson(data['data']['insert_products']['returning'][0]);
}

Future<Rent> putRentOperation(Rent rent, HasuraConnect connection) async {
  var query = r"""
      mutation MyMutation($idClient: Int!, $dateRent: date!, $adress: String!, $productRents: productRent_arr_rel_insert_input!){
        insert_rents(objects: {idClient: $idClient, dateRent: $dateRent, adress: $adress, productRents: $productRents}) {
          returning{
            id
            dateRent
            adress
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
      }  
    """;

  var data = await connection.mutation(query, variables: {
    "idClient": rent.client.id,
    "dateRent": DateFormat('yyyy-MM-dd').format(rent.dateRent),
    "adress": rent.adress ?? "",
    "productRents": {"data": rent.productRents ?? []}
  });
  return Rent.fromJson(data['data']['insert_rents']['returning'][0]);
}
