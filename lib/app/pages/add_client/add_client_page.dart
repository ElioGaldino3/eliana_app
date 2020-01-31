import 'package:cached_network_image/cached_network_image.dart';
import 'package:eliana_app/app/app_module.dart';
import 'package:eliana_app/app/modules/home/home_controller.dart';
import 'package:eliana_app/app/modules/home/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'add_client_controller.dart';

class AddClientPage extends StatefulWidget {
  final String title;
  const AddClientPage({Key key, this.title = "AddClient"}) : super(key: key);

  @override
  _AddClientPageState createState() => _AddClientPageState();
}

class _AddClientPageState extends State<AddClientPage> {
  AddClientController controller = Inject<AppModule>.of().get();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor coloque o nome';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: "Nome"),
              ),
              Divider(),
              TextFormField(
                decoration: InputDecoration(labelText: "Telefone"),
                keyboardType: TextInputType.phone,
              ),
              Divider(),
              controller.client.photoUrl == null ||
                      controller.client.photoUrl.isEmpty
                  ? PhotoAdd()
                  : PhotoExistAdd(urlPhoto: controller.client.photoUrl)
            ],
          ),
        ),
      ),
    );
  }
}

class PhotoAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .27),
              blurRadius: 10.5,
              offset: Offset(2, 0))
        ],
      ),
      child: Icon(
        Icons.add_a_photo,
        size: 35,
      ),
    );
  }
}

class PhotoExistAdd extends StatelessWidget {
  final String urlPhoto;

  const PhotoExistAdd({Key key, this.urlPhoto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .27),
              blurRadius: 10.5,
              offset: Offset(2, 0))
        ],
        image: DecorationImage(
          image: CachedNetworkImageProvider(urlPhoto),
        ),
      ),
    );
  }
}
