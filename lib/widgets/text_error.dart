import 'package:flutter/material.dart';

class TextErrror extends StatelessWidget {

  Function onPressed;
  String text;

  TextErrror(this.text, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Text(text),
        onTap: onPressed,
      )
    );
  }
}