import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Bandung',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: RainbowScreen(),
    );
  }
}

class RainbowScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Container(
              color: Colors.red,
            ),
        ),
        Expanded(
          child: Container(
            color: Colors.orange,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.yellow,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.indigo,
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.purple,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blueAccent,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.amberAccent,
          ),
        ),
      ],
    );
  }

}