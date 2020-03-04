// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

import 'client.dart';
import 'product_order.dart';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  DateTime dataDelivery;
  int id;
  String comment;
  List<ProductOrder> productOrders;
  Client client;

  Order({
    this.dataDelivery,
    this.id,
    this.comment,
    this.productOrders,
    this.client,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        dataDelivery: DateTime.parse(json["dataDelivery"]),
        id: json["id"],
        comment: json["comment"],
        productOrders: List<ProductOrder>.from(
            json["productOrders"].map((x) => ProductOrder.fromJson(x))),
        client: Client.fromJson(json["client"]),
      );

  Map<String, dynamic> toJson() => {
        "dataDelivery":
            "${dataDelivery.year.toString().padLeft(4, '0')}-${dataDelivery.month.toString().padLeft(2, '0')}-${dataDelivery.day.toString().padLeft(2, '0')}",
        "id": id,
        "comment": comment,
        "productOrders":
            List<dynamic>.from(productOrders.map((x) => x.toJson())),
        "client": client.toJson(),
      };

  static fromJsonList(List list) {
    if (list == null) return null;

    return list.map((json) => Order.fromJson(json)).toList();
  }
}
