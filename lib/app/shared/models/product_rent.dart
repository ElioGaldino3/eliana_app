class ProductRent {
    int idProduct;
    int amount;

    ProductRent({
        this.idProduct,
        this.amount,
    });

    factory ProductRent.fromJson(Map<String, dynamic> json) => ProductRent(
        idProduct: json["idProduct"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "idProduct": idProduct,
        "amount": amount,
    };
}
