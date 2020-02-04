class ProductRent {
    int productId;
    int amount;

    ProductRent({
        this.productId,
        this.amount,
    });

    factory ProductRent.fromJson(Map<String, dynamic> json) => ProductRent(
        productId: json["productId"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "amount": amount,
    };
}
