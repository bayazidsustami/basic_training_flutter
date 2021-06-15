import 'package:flutter/material.dart';
import 'package:flutter_learn/detail_screen.dart';
import 'package:flutter_learn/model/tourism_place.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wisata Bandung'),
      ),
      body: ListView.builder(itemBuilder: (context, index){
        final TourismPlace place = tourismPlaceList[index];
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(place: place)));
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Image.asset(place.imageAsset),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          place.name,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(place.location)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
        itemCount: tourismPlaceList.length,
      )
    );
  }
}