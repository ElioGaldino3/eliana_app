// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

import 'package:eliana_app/app/shared/models/client.dart';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  int id;
  String products;
  DateTime dateTime;
  bool delivered;
  Client client;

  Order({
    this.id,
    this.products,
    this.dateTime,
    this.delivered,
    this.client,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        products: json["products"],
        dateTime: DateTime.parse(json["dateTime"]),
        delivered: json["delivered"],
        client: Client.fromJson(json["client"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "products": products,
        "dateTime":
            "${dateTime.year.toString().padLeft(4, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}",
        "delivered": delivered,
        "client": client.toJson(),
      };

  static List<Order> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => Order.fromJson(item)).toList();
  }
}
