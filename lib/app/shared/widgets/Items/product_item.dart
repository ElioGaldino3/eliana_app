import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eliana_app/app/modules/publishers/add_product/add_product_controller.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductItem extends StatelessWidget {
  final Product item;

  const ProductItem(this.item, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed("/add-product/");
        AddProductController addController = Modular.get();
        addController.product = item;
        addController.nameController.text = item.name;
        addController.valueController.text = item.value.toString();
      },
      child: Container(
        height: 90,
        decoration: BoxDecoration(
            color: _getColor(item.isRent),
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
                      image: item.photoUrl.isEmpty
                          ? AssetImage('images/icon-product.png')
                          : CachedNetworkImageProvider(item.photoUrl),
                    )),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AutoSizeText(
                    "${item.name}",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  AutoSizeText(
                    "R\$${item.value.toStringAsFixed(2)}",
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
                  FontAwesomeIcons.plus,
                  size: 23,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color _getColor(bool isRent) {
  if (isRent) {
    return Colors.deepPurple;
  } else {
    return Color(0xFF9B4DCB);
  }
}
