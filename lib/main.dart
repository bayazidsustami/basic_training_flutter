import 'package:flutter/cupertino.dart';
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
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget{
  @override
  _FirstScreen createState() => _FirstScreen();
}

class _FirstScreen extends State<FirstScreen>{

  bool lightOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body:Switch(
        value: lightOn,
        onChanged: (bool value){
          setState(() {
            lightOn = value;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(lightOn ? 'Light On' : 'Light Off'),
              duration: Duration(seconds: 1),
            )
          );
        },
      )
    );
  }
}