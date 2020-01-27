import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'add_product_controller.g.dart';

class AddProductController = _AddProductBase with _$AddProductController;

abstract class _AddProductBase with Store {
  @observable
  TextEditingController textNameController = TextEditingController();
  @observable
  TextEditingController textValueController = TextEditingController();
}
