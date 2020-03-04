// To parse this JSON data, do
//
//     final rent = rentFromJson(jsonString);

import 'dart:convert';

import 'client.dart';
import 'product_rent.dart';

Rent rentFromJson(String str) => Rent.fromJson(json.decode(str));

String rentToJson(Rent data) => json.encode(data.toJson());

class Rent {
    List<ProductRent> productRents;
    String adress;
    int id;
    String comment;
    DateTime dateRent;
    Client client;

    Rent({
        this.productRents,
        this.adress,
        this.id,
        this.comment,
        this.dateRent,
        this.client,
    });

    factory Rent.fromJson(Map<String, dynamic> json) => Rent(
        productRents: List<ProductRent>.from(json["productRents"].map((x) => ProductRent.fromJson(x))),
        adress: json["adress"],
        id: json["id"],
        comment: json["comment"],
        dateRent: DateTime.parse(json["dateRent"]),
        client: Client.fromJson(json["client"]),
    );

    Map<String, dynamic> toJson() => {
        "productRents": List<dynamic>.from(productRents.map((x) => x.toJson())),
        "adress": adress,
        "id": id,
        "comment": comment,
        "dateRent": "${dateRent.year.toString().padLeft(4, '0')}-${dateRent.month.toString().padLeft(2, '0')}-${dateRent.day.toString().padLeft(2, '0')}",
        "client": client.toJson(),
    };
    static fromJsonList(List list) {
    if (list == null) return null;

    return list.map((json) => Rent.fromJson(json)).toList();
  }
}
