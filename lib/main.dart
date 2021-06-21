import 'package:flutter/material.dart';
import 'package:flutter_learn/main_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Catalogue',
      theme: ThemeData(),
      home: MainScreen(),
    );
  }
}