import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:eliana_app/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(ModularApp(module: AppModule())));
}
