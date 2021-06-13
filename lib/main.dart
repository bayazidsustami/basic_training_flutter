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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World!'),
        ),
        body: Center(
          child: BiggerText(
            text: 'adakah',
          ),
        ),
      ),
    );
  }
}


//contoh stateless widget
class Heading extends StatelessWidget{
  final String textOfHeading;

  Heading({this.textOfHeading});

  @override
  Widget build(BuildContext context) {
    return Text(
      textOfHeading,
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold
      ),
    );
  }

}

//conteh stateful widget
class BiggerText extends StatefulWidget{

  final String text;

  const BiggerText({this.text});

  @override
  State<StatefulWidget> createState() {
    return _BiggerTextState();
  }

}

class _BiggerTextState extends State<BiggerText>{
  double _textSize= 16.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(widget.text, style: TextStyle(fontSize: _textSize)),
        ElevatedButton(
            onPressed: (){
              setState(() {
                _textSize = 32.0;
              });
            },
            child: Text("Perbesar"))
      ],
    );
  }

}
