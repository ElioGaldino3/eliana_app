import 'dart:async';
import 'dart:io';
import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:eliana_app/app/shared/repositories/database/operations_hasura/delivered.dart';
import 'package:eliana_app/app/shared/repositories/database/operations_hasura/get_stream.dart';
import 'package:eliana_app/app/shared/repositories/database/operations_hasura/gets.dart';
import 'package:eliana_app/app/shared/repositories/database/operations_hasura/put.dart';
import 'package:eliana_app/app/shared/repositories/database/operations_hasura/update.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';

import 'operations_hasura/delete.dart';
import 'operations_hasura/get.dart';

class DataBaseHasura implements IDatabase {
  HasuraConnect connection;

  DataBaseHasura(this.connection);

  @override
  Future<bool> deleteClient(int id) async {
    return await deleteClientOperation(id, connection);
  }

  @override
  Future<bool> deleteOrder(int id) async {
    return await deleteOrderOperation(id, connection);
  }

  @override
  Future<bool> deleteProduct(int id) async {
    return await deleteProductOperation(id, connection);
  }

  @override
  Future<bool> deleteRent(int id) async {
    return await deleteRentOperation(id, connection);
  }

  @override
  ObservableStream getStreamClients() {
    return getStreamClientsOperation(connection);
  }

  @override
  ObservableStream getStreamOrders() {
    return getStreamOrdersOperation(connection);
  }

  @override
  ObservableStream getStreamProducts() {
    return getStreamProductsOperation(connection);
  }

  @override
  ObservableStream getStreamRents() {
    return getStreamRentsOperation(connection);
  }

  @override
  Future<Client> putClient(Client client) async {
    return await putClientOperation(client, connection);
  }

  @override
  Future<Order> putOrder(Order order) async {
    return await putOrderOperation(order, connection);
  }

  @override
  Future<Product> putProduct(Product product) async {
    return await putProductOperation(product, connection);
  }

  @override
  Future<Rent> putRent(Rent rent) async {
    return await putRentOperation(rent, connection);
  }

  @override
  Future<bool> updateClient(Client client) async {
    return await updateClientOperation(client, connection);
  }

  @override
  Future<bool> updateProduct(Product product) async {
    return await updateProductOperation(product, connection);
  }

  @override
  Future<Client> getClient(int id) async {
    return await getClientOperation(id, connection);
  }

  @override
  Future<Order> getOrder(int id) async {
    return await getOrderOperation(id, connection);
  }

  @override
  Future<Product> getProduct(int id) async {
    return await getProductOperation(id, connection);
  }

  @override
  Future<Rent> getRent(int id) async {
    return await getRentOperation(id, connection);
  }


  @override
  Future<List<Client>> getClients() async {
    return await getClientsOperation(connection);
  }

  @override
  Future<List<Order>> getOrders() async {
    return await getOrdersOperation(connection);
  }

  @override
  Future<List<Product>> getProducts() async {
    return await getProductsOperation(connection);
  }

  @override
  Future<List<Rent>> getRents() async {
    return await getRentsOperation(connection);
  }

  @override
  Future<bool> deliveredOrder(Order order) async {
    return await deliveredOrderOperation(order, connection);
  }

  @override
  Future<bool> deliveredRent(Rent rent) async {
    return await deliveredRentOperation(rent, connection);
  }

  //utilizando o firebase
  @override
  Future<String> uploadImage(File file, int id) async {
    StorageUploadTask task = FirebaseStorage.instance
        .ref()
        .child("clientesPhotos")
        .child(id.toString())
        .putFile(file);
    StorageTaskSnapshot snapshot = await task.onComplete;

    return await snapshot.ref.getDownloadURL();
  }

}
