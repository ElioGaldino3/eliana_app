import 'package:eliana_app/app/shared/models/order.dart';
import 'package:eliana_app/app/shared/models/product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductItem extends StatelessWidget {
  final Product data;

  const ProductItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            gradient: new LinearGradient(
              colors: [Colors.purple, Colors.deepPurple],
            ),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: EdgeInsets.only(left: 15),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(FontAwesomeIcons.archive),
                onPressed: () {},
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        data.name,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "R\$${data.value}",
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 6),
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    print(data.id);
                  },
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, "/product/${data.id}");
      },
    );
  }

  Color getColor(DateTime date) {
    final int diffDays = date.difference(DateTime.now()).inDays;

    if (diffDays == 0)
      return Colors.red;
    else if (diffDays > 0 && diffDays <= 1)
      return Color.fromARGB(255, 255, 112, 67);
    else if (diffDays > 1 && diffDays <= 3)
      return Color.fromARGB(255, 255, 202, 40);
    else
      return Colors.green;
  }
}
