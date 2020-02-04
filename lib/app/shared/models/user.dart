// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    int id;
    String uid;
    bool isUser;
    bool isAdmin;

    User({
        this.id,
        this.uid,
        this.isUser,
        this.isAdmin,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        uid: json["uid"],
        isUser: json["isUser"],
        isAdmin: json["isAdmin"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "isUser": isUser,
        "isAdmin": isAdmin,
    };
}
