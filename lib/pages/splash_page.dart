
import 'package:flutter/material.dart';
import 'package:flutter_parser_json/pages/dogs_page.dart';
import 'package:flutter_parser_json/utils/nav.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();


    splash(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: AssetImage("assets/images/splash.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(child: CircularProgressIndicator(),),
    );
  }

  void splash(context) {
    Future.delayed(Duration(seconds: 2)).then((value) {
      print("Fim splash");
      pushReplacement(context, DogsPage());
    });
  }
}
