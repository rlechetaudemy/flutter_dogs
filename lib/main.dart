import 'package:flutter/material.dart';
import 'package:flutter_parser_json/pages/dogs_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DogsPage(),
    );
  }
}

