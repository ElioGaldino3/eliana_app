// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    int id;
    String name;
    double value;
    bool isRent;

    Product({
        this.id,
        this.name,
        this.value,
        this.isRent,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        value: json["value"].toDouble(),
        isRent: json["isRent"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": value,
        "isRent": isRent,
    };

    static List<Product> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => Product.fromJson(item)).toList();
  }
}
