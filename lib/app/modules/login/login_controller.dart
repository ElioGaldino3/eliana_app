import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  @action
  putFirestore(String text) {
    Firestore.instance
        .collection("col")
        .document("doc")
        .setData({"text": text});
  }
}
