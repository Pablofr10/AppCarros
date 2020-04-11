import 'package:flutter/material.dart';

alert(BuildContext context, String  msg) {
      showDialog(context: context, barrierDismissible: false, builder: (context) => 
        WillPopScope(
          onWillPop: () async => false,
            child: AlertDialog(
            title: Text("Sorveteria"),
            content: Text(msg),
            actions: <Widget>[
              FlatButton(onPressed: () { Navigator.pop(context); print("Ok"); }, 
                child: Text("Ok"),
              )
            ],
          ),
        )
      );
    }