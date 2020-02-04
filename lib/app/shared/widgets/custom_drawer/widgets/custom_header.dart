import 'package:eliana_app/app/shared/repositories/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 115,
        padding: const EdgeInsets.only(left: 40),
        color: Colors.purple[700],
        child: Row(
          children: <Widget>[
            Icon(
              FontAwesomeIcons.user,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Acesse sua conta agora!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                  GestureDetector(
                    onTap: () {
                      Modular.get<AuthController>().logout();
                      Modular.to.pushReplacementNamed('/login/');
                    },
                    child: Text(
                      "Saia agora!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
