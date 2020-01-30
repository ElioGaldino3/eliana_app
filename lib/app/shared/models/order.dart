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
    DateTime dataDelivery;
    Client client;

    Order({
        this.id,
        this.products,
        this.dataDelivery,
        this.client,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        products: json["products"],
        dataDelivery: DateTime.parse(json["dataDelivery"]),
        client: Client.fromJson(json["client"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "products": products,
        "dataDelivery": "${dataDelivery.year.toString().padLeft(4, '0')}-${dataDelivery.month.toString().padLeft(2, '0')}-${dataDelivery.day.toString().padLeft(2, '0')}",
        "client": client.toJson(),
    };
}


