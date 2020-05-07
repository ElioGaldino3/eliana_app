import 'dart:async';
import 'dart:io';

import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:eliana_app/app/shared/models/user.dart';
import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:eliana_app/app/shared/repositories/database/operations_hasura/delivered.dart';
import 'package:eliana_app/app/shared/repositories/database/operations_hasura/get_stream.dart';
import 'package:eliana_app/app/shared/repositories/database/operations_hasura/gets.dart';
import 'package:eliana_app/app/shared/repositories/database/operations_hasura/put.dart';
import 'package:eliana_app/app/shared/repositories/database/operations_hasura/update.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'custom_hasura_connect.dart';
import 'operations_hasura/delete.dart';
import 'operations_hasura/get.dart';

class DataBaseHasura implements IDatabase {
  final CustomHasuraConnect connection = Modular.get();

  @override
  Future<bool> deleteClient(int id) async {
    return await deleteClientOperation(id, connection.client);
  }

  @override
  Future<bool> deleteOrder(int id) async {
    return await deleteOrderOperation(id, connection.client);
  }

  @override
  Future<bool> deleteProduct(int id) async {
    return await deleteProductOperation(id, connection.client);
  }

  @override
  Future<bool> deleteRent(int id) async {
    return await deleteRentOperation(id, connection.client);
  }

  @override
  Stream<List<Client>> getStreamClients() {
    return getStreamClientsOperation(connection.client);
  }

  @override
  Stream<List<Order>> getStreamOrders() {
    return getStreamOrdersOperation(connection.client);
  }

  @override
  Stream<List<Product>> getStreamProducts() {
    return getStreamProductsOperation(connection.client);
  }

  @override
  Stream<List<Rent>> getStreamRents() {
    return getStreamRentsOperation(connection.client);
  }

  @override
  Future<Client> putClient(Client client) async {
    return await putClientOperation(client, connection.client);
  }

  @override
  Future<Order> putOrder(Order order) async {
    return await putOrderOperation(order, connection.client);
  }

  @override
  Future<Product> putProduct(Product product) async {
    return await putProductOperation(product, connection.client);
  }

  @override
  Future<Rent> putRent(Rent rent) async {
    return await putRentOperation(rent, connection.client);
  }

  @override
  Future<bool> updateClient(Client client) async {
    return await updateClientOperation(client, connection.client);
  }

  @override
  Future<bool> updateProduct(Product product) async {
    return await updateProductOperation(product, connection.client);
  }

  @override
  Future<Client> getClient(int id) async {
    return await getClientOperation(id, connection.client);
  }

  @override
  Future<Order> getOrder(int id) async {
    return await getOrderOperation(id, connection.client);
  }

  @override
  Future<Product> getProduct(int id) async {
    return await getProductOperation(id, connection.client);
  }

  @override
  Future<Rent> getRent(int id) async {
    return await getRentOperation(id, connection.client);
  }

  @override
  Future<List<Client>> getClients() async {
    return await getClientsOperation(connection.client);
  }

  @override
  Future<List<Order>> getOrders() async {
    return await getOrdersOperation(connection.client);
  }

  @override
  Future<List<Product>> getProducts() async {
    return await getProductsOperation(connection.client);
  }

  @override
  Future<List<Rent>> getRents() async {
    return await getRentsOperation(connection.client);
  }

  @override
  Future<bool> deliveredOrder(Order order) async {
    return await deliveredOrderOperation(order, connection.client);
  }

  @override
  Future<bool> deliveredRent(Rent rent) async {
    return await deliveredRentOperation(rent, connection.client);
  }

  //utilizando o firebase
  @override
  Future<String> uploadImage(File file, int id, String type) async {
    StorageUploadTask task = FirebaseStorage.instance
        .ref()
        .child(type)
        .child(id.toString())
        .putFile(file);
    StorageTaskSnapshot snapshot = await task.onComplete;

    return await snapshot.ref.getDownloadURL();
  }

  @override
  Future<User> newUser(String uid) async {
    return await putUserOperation(uid, connection.client);
  }

  @override
  Future<User> getUser(String uid) async {
    return await getUserOperation(uid, connection.client);
  }
}
