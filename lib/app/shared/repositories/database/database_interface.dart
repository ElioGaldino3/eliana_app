import 'dart:io';

import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/models/rent.dart';
import 'package:eliana_app/app/shared/models/user.dart';

abstract class IDatabase {
  //Getters Streams
  Stream<List<Order>> getStreamOrders();
  Stream<List<Rent>> getStreamRents();
  Stream<List<Product>> getStreamProducts();
  Stream<List<Client>> getStreamClients();

  //Putters
  Future<Order> putOrder(Order order);
  Future<Rent> putRent(Rent rent);
  Future<Product> putProduct(Product product);
  Future<Client> putClient(Client client);

  //Updaters
  Future<bool> updateProduct(Product product);
  Future<bool> updateClient(Client client);

  //Deletters
  Future<bool> deleteRent(int id);
  Future<bool> deleteOrder(int id);
  Future<bool> deleteProduct(int id);
  Future<bool> deleteClient(int id);

  //Getters List
  Future<List<Product>> getProducts();
  Future<List<Client>> getClients();
  Future<List<Order>> getOrders();
  Future<List<Rent>> getRents();

  //Getters only by id
  Future<Order> getOrder(int id);
  Future<Rent> getRent(int id);
  Future<Product> getProduct(int id);
  Future<Client> getClient(int id);
  Future<User> getUser(String uid);

  //Update Delivered
  Future<bool> deliveredOrder(Order order);
  Future<bool> deliveredRent(Rent rent);

  //Upload Image
  Future<String> uploadImage(File file, int id, String type);

  //New User
  Future<User> newUser(String uid);
}
