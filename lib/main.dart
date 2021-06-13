import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ), onPressed: () {  },
        ) ,
        title: Text('First Screen'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ), onPressed: () {  },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Text('a title', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          Text('Lorem ipsum ipsum'),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('text in border'),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.red
            ),
          )
        ],
      )
    );
  }

}