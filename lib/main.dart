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

  String language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Radio<String>(
              value: 'Dart',
              groupValue: language,
              onChanged: (String value){
                setState(() {
                  language = value;
                  showSnackBar();
                });
              },
            ),
            title: (Text('Dart')),
          ),
          ListTile(
            leading: Radio<String>(
              value: 'Kotlin',
              groupValue: language,
              onChanged: (String value){
                setState(() {
                  language = value;
                  showSnackBar();
                });
              },
            ),
            title: (Text('Kotlin')),
          ),
          ListTile(
            leading: Radio<String>(
              value: 'Swift',
              groupValue: language,
              onChanged: (String value){
                setState(() {
                  language = value;
                  showSnackBar();
                });
              },
            ),
            title: (Text('Swift')),
          )
        ],
      )
    );
  }

  void showSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(language),
          duration: Duration(seconds: 1),
        )
    );
  }
}