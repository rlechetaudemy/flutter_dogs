import 'package:flutter/material.dart';

alert(context, String title, String msg, {Function callback}) {
  showDialog(context: context,
      builder: (context){
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.pop(context);
                if(callback != null) {
                  callback();
                }
              },
              child: Text("OK"),
            )
          ],
        );
      });
}