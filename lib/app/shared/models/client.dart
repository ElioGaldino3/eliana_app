class Client {
    int id;
    String name;
    String phone;
    String photoUrl;

    Client({
        this.id,
        this.name,
        this.phone,
        this.photoUrl,
    });

    factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        photoUrl: json["photoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "photoUrl": photoUrl,
    };
}
