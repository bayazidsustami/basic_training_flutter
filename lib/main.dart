import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Bandung',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            if(constraints.maxWidth < 600){
              return ListView(
                children: _generateContainer(),
              );
            }else if(constraints.maxWidth < 900){
              return GridView.count(
                  crossAxisCount: 2,
                children: _generateContainer(),
              );
            } else {
              return GridView.count(
                crossAxisCount: 6,
                children: _generateContainer(),
              );
            }
          },
        )
    );
  }

  List<Widget> _generateContainer() {
    return List<Widget>.generate(20, (index) {
      return Container(
        margin: const EdgeInsets.all(10),
        color: Colors.blueGrey,
        height: 200,
      );
    });
  }
}

