class ProductOrder {
    int idProduct;
    int amount;

    ProductOrder({
        this.idProduct,
        this.amount,
    });

    factory ProductOrder.fromJson(Map<String, dynamic> json) => ProductOrder(
        idProduct: json["idProduct"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "idProduct": idProduct,
        "amount": amount,
    };
}
