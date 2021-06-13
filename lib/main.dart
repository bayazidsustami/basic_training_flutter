import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Bandung',
      theme: ThemeData(),
      home: DetailScreen(),
    );
  }
}

class DetailScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text('Farm House Lembang')
            )
          ],
        ),
      )
    );
  }

}