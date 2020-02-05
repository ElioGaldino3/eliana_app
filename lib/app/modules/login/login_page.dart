import 'package:eliana_app/app/modules/login/login_controller.dart';
import 'package:eliana_app/app/shared/repositories/auth_controller.dart';
import 'package:eliana_app/app/shared/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = Modular.get();
  AuthController auth = Modular.get();
  @override
  void initState() {
    if (auth.userDB != null) {
      if (auth.userDB.isUser && auth.status == AuthStatus.login)
        Modular.to.pushReplacementNamed('/orders/');
      else if (!auth.userDB.isUser && auth.status == AuthStatus.login)
        controller.tryAcess = true;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            Observer(builder: (_) {
              if (controller.haveAcess) {
                Modular.to.pushReplacementNamed('/orders/');
                return Center(child: CircularProgressIndicator());
              }
              return Padding(
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
                    : RaisedButton(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text("Faça o login com o Google!"),
                        ),
                        onPressed: () async {
                          controller.loginWithGoogle();
                        },
                      ),
              );
            })
          ],
        ),
      ),
    );
  }
}
