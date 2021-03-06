import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eliana_app/app/modules/publishers/add_product/add_product_controller.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../add_product_order_button.dart';
import '../add_product_rent_button.dart';

class ProductItem extends StatefulWidget {
  final Product item;

  const ProductItem(this.item, {Key key}) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed("/add-product/");
        AddProductController addController = Modular.get();
        addController.product = widget.item;
        addController.nameController.text = widget.item.name;
        addController.valueController.text = widget.item.value.toString();
      },
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, .15),
                  blurRadius: 0,
                  offset: Offset(0, 4))
            ]),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Container(
                width: 67,
                height: 67,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: _getColor(widget.item.isRent), width: 4),
                    borderRadius: BorderRadius.circular(3),
                    image: DecorationImage(
                      image: widget.item.photoUrl == null ||
                              widget.item.photoUrl.isEmpty
                          ? AssetImage('images/icon-product.png')
                          : CachedNetworkImageProvider(widget.item.photoUrl),
                    )),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AutoSizeText(
                    "${widget.item.name}",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  AutoSizeText(
                    "R\$${widget.item.value.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: widget.item.isRent
                    ? AddProductRentButton(widget.item)
                    : AddProductOrderButton(widget.item)),
          ],
        ),
      ),
    );
  }
}

Color _getColor(bool isRent) {
  if (isRent) {
    return Colors.deepPurple[900];
  } else {
    return Color(0xFF9B4DCB);
  }
}
