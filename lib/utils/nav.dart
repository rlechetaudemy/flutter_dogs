
import 'package:flutter/material.dart';

push(BuildContext context,Widget page) {
  return Navigator.push(context, MaterialPageRoute(
      builder: (context) => page
  ));
}

pushReplacement(BuildContext context,Widget page) {
  return Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => page
  ));
}
