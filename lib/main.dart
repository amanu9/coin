import 'dart:convert';

import 'package:coincup/models/app_config.dart';
import 'package:coincup/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadConfig();
  runApp(const MyApp());
}

Future<void> loadConfig() async {
  String _configContemt =
      await rootBundle.loadString("assets/config/main.json");
  Map _configData = jsonDecode(_configContemt);
  GetIt.instance.registerSingleton<Appconfig>(
    Appconfig(COIN_API_BASE_URL: _configData['COIN_API_BASE_URL']),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(88, 60, 197, 1.0)),
      home: const HomePage(),
    );
  }
}
