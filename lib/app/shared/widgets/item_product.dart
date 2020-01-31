import 'package:auto_size_text/auto_size_text.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:eliana_app/app/shared/utils/formatDate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
          color: _getColor(product.isRent),
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
            child: Icon(
              FontAwesomeIcons.box,
              size: 32,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AutoSizeText(
                  "${product.name}",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                AutoSizeText(
                  "R\$${product.value.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.plus,
              size: 23,
            ),
          ),
        ],
      ),
    );
  }
}

Color _getColor(bool isRent) {
  if (isRent) {
    return Colors.deepPurple;
  } else{
    return Color(0xFF9B4DCB);
  }
}
