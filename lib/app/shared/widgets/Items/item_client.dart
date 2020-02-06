import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eliana_app/app/modules/publishers/add_client/add_client_controller.dart';
import 'package:eliana_app/app/shared/models/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ClientItem extends StatelessWidget {
  final Client client;
  final Function onTap;

  const ClientItem(this.client, {Key key, this.onTap}) : super(key: key);

  void whatsAppOpen() async {
    print('55${client.phone}');
    var whatsappUrl =
        "whatsapp://send?phone= 55${client.phone}&text=Olá ${client.name}.";
    await canLaunch(whatsappUrl)
        ? launch(whatsappUrl)
        : print("Error Whatsapp open");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 90,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, .09),
                  blurRadius: 1,
                  offset: Offset(0, 3))
            ]),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Container(
                width: 67,
                height: 67,
                decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(98, 2, 238, .1), width: 2),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: client.photoUrl == null || client.photoUrl.isEmpty
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
                    "${client.phone}",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600]),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                onPressed: () {
                  whatsAppOpen();
                },
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
        AddClientController addController = Modular.get();
        addController.client = client;
        addController.nameController.text = client.name;
        addController.phoneController.text = client.phone;
      },
    );
  }
}
