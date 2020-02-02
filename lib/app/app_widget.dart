import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:oktoast/oktoast.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Modular.navigatorKey,
        title: 'Eliana App',
        theme:
            ThemeData(primarySwatch: Colors.deepPurple, fontFamily: 'OpenSans'),
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute,
      ),
      
    );
  }
}
