import 'dart:io';

import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/repositories/database/database_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'add_product_controller.g.dart';

class AddProductController = _AddProductBase with _$AddProductController;

abstract class _AddProductBase with Store {
  IDatabase _hasura = Modular.get();

  @observable
  Product product = Product(isRent: false);

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  TextEditingController valueController = TextEditingController();

  @computed
  String get nameText => nameController.text;

  _AddProductBase() {
    nameController.text = product.name;
    valueController.text =
        product.value == null ? "" : product.value.toString();
  }

  @action
  uploadImage(File image) async {
    String urlPhoto = await _hasura.uploadImage(image, product.id, "products");
    Product newProduct = Product(
        id: product.id,
        name: product.name,
        value: product.value,
        photoUrl: urlPhoto);
    product = newProduct;
    _hasura.updateProduct(product);
  }

  @action
  addProduct() async {
    if (product.id != null) {
      Product newProduct = Product(
          id: product.id,
          name: nameController.text,
          value: double.parse(valueController.text),
          isRent: product.isRent,
          photoUrl: product.photoUrl);
      product = newProduct;
      _hasura.updateProduct(newProduct);
    } else {
      product.name = nameController.text;
      product.value = double.parse(valueController.text);
      await _hasura.putProduct(product);
    }
  }

  @action
  changeOptionRent(bool isRent) {
    Product newProduct = product;
    newProduct.isRent = isRent;
    product = newProduct;
  }

  @action
  reset() {
    nameController.clear();
    valueController.clear();
    product = Product(id: null);
  }
}
