import 'dart:async';
import 'dart:io';
import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';

class DataBaseHasura implements IDatabase {
  HasuraConnect connection;

  DataBaseHasura() {
    connection = HasuraConnect('http://192.168.42.212:8080/v1/graphql');
  }

  @override
  Future<bool> deleteClient(int id) async {
    String query = """
      mutation MyMutation{
        delete_clients(where: {id: {_eq: $id}}) {
          affected_rows
        }
      }
    """;

    var data = await connection.mutation(query, variables: {"id": id});
    return data['data']['delete_clients']['affected_rows'] >= 1;
  }

  @override
  Future<bool> deleteOrder(int id) async {
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

  @override
  Future<bool> deleteProduct(int id) async {
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

  @override
  Future<bool> deleteRent(int id) async {
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

  @override
  ObservableStream getClients() {
    var query = """
      subscription getClients {
        clients(order_by: {name: asc}) {
          id
          name
          phone
          photoUrl
        }
      }
    """;

    Snapshot snapshot = connection.subscription(query);
    return snapshot.asObservable();
  }

  @override
  ObservableStream getOrders() {
    var query = """
      subscription MySubscription {
        orders(order_by: {dataDelivery: asc}, where: {isDelivery: {_eq: false}}) {
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
    Snapshot snapshot = connection.subscription(query);
    return snapshot.asObservable();
  }

  @override
  ObservableStream getProducts() {
    var query = """
      subscription getProdutos {
        products(order_by: {name: asc}) {
          id
          name
          value
          isRent
          photoUrl
        }
      }
    """;

    Snapshot snapshot = connection.subscription(query);
    return snapshot.asObservable();
  }

  @override
  ObservableStream getRents() {
    var query = """
      subscription MySubscription {
        rents(order_by: {dateRent: asc}, where: {isFinished: {_eq: false}}) {
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

    Snapshot snapshot = connection.subscription(query);
    return snapshot.asObservable();
  }

  @override
  Future<bool> putClient(Client client) async {
    var query = """
      mutation MyMutation(\$name: String!, \$phone: String!, \$photoUrl: String!){
        insert_clients(objects: {name: \$name, phone: \$phone, photoUrl: \$photoUrl}) {
          affected_rows
        }
      }    
    """;

    var data = await connection.mutation(query, variables: {
      'name': client.name,
      'phone': client.phone,
      'photoUrl': client.photoUrl
    });
    return data['data']['insert_clients']['affected_rows'] >= 1;
  }

  @override
  Future<bool> putOrder(Order order, {bool isDelivery = false}) async {
    var query = """
      mutation MyMutation(\$clientId, \$dataDelivery, \$products, \$isDelivery){
        insert_orders(objects: {clientId: \$clientId, dataDelivery: \$dataDelivery, isDelivery: \$isDelivery,
        productOrders: {data: \$products}}) {
          affected_rows
        }
      }    
    """;

    var data = await connection.mutation(query, variables: {
      "clientId": order.client.id,
      "dataDelivery": order.dataDelivery,
      "products": order.productOrders,
      "isDelivery": isDelivery
    });
    return data['data']['insert_orders']['affected_rows'] >= 1;
  }

  @override
  Future<bool> putProduct(Product product) async {
    var query = """
      mutation putProdutos(\$name, \$value, \$isRent, \$photoUrl) {
        insert_products(objects: {name: "", value: "", isRent: false, photoUrl: ""}) {
          affected_rows
        }
      }   
    """;

    var data = await connection.mutation(query, variables: {
      "name": product.name,
      "value": product.value,
      "isRent": product.isRent,
      "photoUrl": product.photoUrl
    });
    return data['data']['insert_products']['affected_rows'] >= 1;
  }

  @override
  Future<bool> putRent(Rent rent, {bool isFinished = false}) async {
    var query = """
      mutation MyMutation(\$idClient, \$dateRent, \$isFinished, \$adress, \$productRents){
        insert_rents(objects: {idClient: \$idClient, dateRent: \$dateRent, isFinished: \$isFinished,adress: \$adress, productRents: {data: \$productRents}}) {
          affected_rows
        }
      }  
    """;

    var data = await connection.mutation(query, variables: {
      "idClient": rent.client.id,
      "dateRent": rent.dateRent,
      "adress": rent.adress,
      "productRents": rent.productRents,
      "isFinished": isFinished
    });
    return data['data']['insert_products']['affected_rows'] >= 1;
  }

  @override
  Future<bool> updateClient(Client client) async {
    var query = """
    mutation MyMutation(\$id, \$name, \$phone, \$photoUrl){
      update_clients(where: {id: {_eq: \$id}}, _set: {name: \$name, phone: \$phone, photoUrl: \$photoUrl}) {
        affected_rows
      }
    }
    """;
    var data = await connection.mutation(query, variables: {
      "id": client.id,
      "name": client.name,
      "phone": client.phone,
      "photoUrl": client.photoUrl
    });
    return data['data']['update_clients']['affected_rows'] >= 1;
  }

  @override
  Future<bool> updateProduct(Product product) async {
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

  @override
  Future<String> uploadImage(File file) {
    return null;
  }

  @override
  Future<Client> getClient(int id) async {
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

    var data = await connection.mutation(query, variables: {
      "id": id,
    });

    return Client.fromJson(data['data']['clients'][0]);
  }

  @override
  Future<Order> getOrder(int id) async {
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

    var data = await connection.mutation(query, variables: {
      "id": id,
    });

    return Order.fromJson(data['data']['orders'][0]);
  }

  @override
  Future<Product> getProduct(int id) async {
    var query = """
    query getProduto(\$id){
      products(where: {id: {_eq: \$id}}) {
        id
        name
        value
        isRent
        photoUrl
      }
    }
    """;

    var data = await connection.mutation(query, variables: {
      "id": id,
    });

    return Product.fromJson(data['data']['products'][0]);
  }

  @override
  Future<Rent> getRent(int id) async {
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

    var data = await connection.mutation(query, variables: {
      "id": id,
    });

    return Rent.fromJson(data['data']['rents'][0]);
  }
}
