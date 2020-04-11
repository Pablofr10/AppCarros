import 'package:carros/pages/home_page.dart';
import 'package:carros/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(       
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white
      ),
      home: HomePage(),
    );
  }
}
