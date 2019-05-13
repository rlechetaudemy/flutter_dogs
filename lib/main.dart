import 'package:flutter/material.dart';
import 'package:flutter_parser_json/pages/splash_page.dart';
import 'package:flutter_parser_json/utils/appbar_utils.dart';

void main() {
  AppBarUtils.setSystemBarWhiteColor();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
    );
  }
}

