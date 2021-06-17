import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Text('Meal Catalogue', style: TextStyle(
                    fontFamily: 'Oxygen',
                    fontSize: 16
                ),),
            ),
            SizedBox(height: 20,),
            MainItem(mealName: 'Ikan Bakar')
          ],
        )
      ),
    );
  }
}

class MainItem extends StatelessWidget{

  final String mealName;

  MainItem({required this.mealName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Card(
            child: Image.network('https://www.themealdb.com/images/media/meals/1548772327.jpg'),
          ),
        )
      ],
    );
  }

}