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

  bool isAgree = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: ListTile(
        leading: Checkbox(
          value: isAgree,
          onChanged: (bool value){
            setState(() {
              isAgree = value;
            });
          },
        ),
        title: Text('Agree/Disagree'),
      )
    );
  }
}