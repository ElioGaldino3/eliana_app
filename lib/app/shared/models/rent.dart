// To parse this JSON data, do
//
//     final rent = rentFromJson(jsonString);

import 'dart:convert';

import 'package:eliana_app/app/shared/models/client.dart';

Rent rentFromJson(String str) => Rent.fromJson(json.decode(str));

String rentToJson(Rent data) => json.encode(data.toJson());

class Rent {
    int id;
    DateTime dateRent;
    String products;
    Client client;

    Rent({
        this.id,
        this.dateRent,
        this.products,
        this.client,
    });

    factory Rent.fromJson(Map<String, dynamic> json) => Rent(
        id: json["id"],
        dateRent: DateTime.parse(json["dateRent"]),
        products: json["products"],
        client: Client.fromJson(json["client"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "dateRent": "${dateRent.year.toString().padLeft(4, '0')}-${dateRent.month.toString().padLeft(2, '0')}-${dateRent.day.toString().padLeft(2, '0')}",
        "products": products,
        "client": client.toJson(),
    };
}
