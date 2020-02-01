// To parse this JSON data, do
//
//     final rent = rentFromJson(jsonString);

import 'dart:convert';

import 'package:eliana_app/app/shared/models/client.dart';
import 'package:eliana_app/app/shared/models/product_rent.dart';

Rent rentFromJson(String str) => Rent.fromJson(json.decode(str));

String rentToJson(Rent data) => json.encode(data.toJson());

class Rent {
  int id;
  DateTime dateRent;
  String adress;
  List<ProductRent> productRents;
  Client client;

  Rent({
    this.id,
    this.dateRent,
    this.adress,
    this.productRents,
    this.client,
  });

  factory Rent.fromJson(Map<String, dynamic> json) => Rent(
        id: json["id"],
        dateRent: DateTime.parse(json["dateRent"]),
        adress: json["adress"],
        productRents: List<ProductRent>.from(json["productRents"].map((x) => x)),
        client: Client.fromJson(json["client"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateRent":
            "${dateRent.year.toString().padLeft(4, '0')}-${dateRent.month.toString().padLeft(2, '0')}-${dateRent.day.toString().padLeft(2, '0')}",
        "adress": adress,
        "productRents": List<dynamic>.from(productRents.map((x) => x.toJson())),
        "client": client.toJson(),
      };
}
