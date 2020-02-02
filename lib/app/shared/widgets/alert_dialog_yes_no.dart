import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AlertDialogYesNo extends StatelessWidget {
  final String title;
  final String content;
  final Function yesFunction;

  const AlertDialogYesNo({Key key, this.title, this.content, this.yesFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            AutoSizeText(content),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Não"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("Sim"),
          onPressed: () {
            yesFunction();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
