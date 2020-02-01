import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eliana_app/app/shared/models/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClientItem extends StatelessWidget {
  final Client client;
  final Function onTap;

  const ClientItem(this.client, {Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 90,
        decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, .27),
                  blurRadius: 10.5,
                  offset: Offset(3, 10))
            ]),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: client.photoUrl.isEmpty
                          ? AssetImage('images/icon-client.png')
                          : CachedNetworkImageProvider(client.photoUrl),
                    )),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AutoSizeText(
                    "${client.name}",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  AutoSizeText(
                    "R\$${client.phone}",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.whatsapp,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Modular.to.pushNamed("/add-client/");
      },
    );
  }
}
