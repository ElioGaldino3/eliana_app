import 'package:eliana_app/app/modules/login/login_controller.dart';
import 'package:eliana_app/app/shared/widgets/loading_animation.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.purple[700], Colors.purple[200]])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    height: 210,
                    child: Image.asset(
                      'icons/icon.png',
                    )),
                Center(
                    child: Text(
                  "Eliana App",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )),
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: controller.tryAcess
                      ? Column(
                          children: <Widget>[
                            Text("Você não tem acesso ao aplicativo",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700)),
                            Text("para mais informações contate-me:",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                            SizedBox(
                              height: 15,
                            ),
                            Text("eliogaldino79@outlook.com",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500))
                          ],
                        )
                      : controller.loading
                          ? LoadingAnimation()
                          : RaisedButton(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text("Faça o login com o Google!"),
                              ),
                              onPressed: () {
                                controller.powerLoading();
                                controller.loginWithGoogle();
                              },
                            ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
