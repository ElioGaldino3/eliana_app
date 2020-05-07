import 'package:cached_network_image/cached_network_image.dart';
import 'package:eliana_app/app/shared/repositories/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthController auth = Modular.get();
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 115,
        padding: const EdgeInsets.only(left: 20),
        color: Colors.purple[700],
        child: Row(
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(auth.user.photoUrl),
                  )),
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
                    auth.user.displayName,
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Log out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.clip,
                      ),
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
