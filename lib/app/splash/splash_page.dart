import 'package:eliana_app/app/shared/repositories/auth_controller.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    disposer = autorun((_) async {
      final controller = Modular.get<AuthController>();
      if (controller.status == AuthStatus.login) {
        Modular.to.pushReplacementNamed('/login/');
      } else if (controller.status == AuthStatus.logoff) {
        Modular.to.pushReplacementNamed('/login/');
      } else if (controller.status == AuthStatus.haveAcess) {
        Modular.to.pushReplacementNamed('/rents-orders/');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 150,
          child: FlareActor("animations/ElianaLoading.flr", animation: "Loading",),
        ),
      ),
    );
  }
}
