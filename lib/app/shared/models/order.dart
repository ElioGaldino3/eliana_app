// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/models/product_order.dart';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
    int id;
    DateTime dataDelivery;
    List<ProductOrder> productOrders;
    Client client;

    Order({
        this.id,
        this.dataDelivery,
        this.productOrders,
        this.client,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        dataDelivery: DateTime.parse(json["dataDelivery"]),
        productOrders: List<ProductOrder>.from(json["productOrders"].map((x) => ProductOrder.fromJson(x))),
        client: Client.fromJson(json["client"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "dataDelivery": "${dataDelivery.year.toString().padLeft(4, '0')}-${dataDelivery.month.toString().padLeft(2, '0')}-${dataDelivery.day.toString().padLeft(2, '0')}",
        "productOrders": List<dynamic>.from(productOrders.map((x) => x.toJson())),
        "client": client.toJson(),
    };
}
