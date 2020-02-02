import 'dart:io';

import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:mobx/mobx.dart';

abstract class IDatabase {
  ObservableStream getStreamOrders();
  ObservableStream getStreamRents();
  ObservableStream getStreamProducts();
  ObservableStream getStreamClients();
  Future<Order> putOrder(Order order, {bool isDelivery = false});
  Future<Rent> putRent(Rent rent, {bool isFinished = false});
  Future<Product> putProduct(Product product);
  Future<Client> putClient(Client client);
  Future<bool> updateProduct(Product product);
  Future<bool> updateClient(Client client);
  Future<bool> deleteRent(int id);
  Future<bool> deleteOrder(int id);
  Future<bool> deleteProduct(int id);
  Future<bool> deleteClient(int id);
  Future<List<Product>> getProducts();
  Future<List<Client>> getClients();
  Future<List<Order>> getOrders();
  Future<List<Rent>> getRents();
  Future<Order> getOrder(int id);
  Future<Rent> getRent(int id);
  Future<Product> getProduct(int id);
  Future<Client> getClient(int id);

  Future<String> uploadImage(File file, int id);
}
