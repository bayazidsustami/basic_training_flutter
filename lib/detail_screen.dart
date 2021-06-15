import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/model/tourism_place.dart';

var _informationStyle = TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget{

  final TourismPlace place;

  DetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(place.imageAsset),
                Container(
                    margin: EdgeInsets.only(top: 16.0),
                    child: Text(
                        place.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Staatliches'
                      ),
                    )
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(Icons.calendar_today),
                          SizedBox(height: 8.0,),
                          Text(place.openDays, style: _informationStyle,)
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.access_time),
                          SizedBox(height: 8.0,),
                          Text(place.openTime, style: _informationStyle,)
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.monetization_on),
                          SizedBox(height: 8.0,),
                          Text(place.ticketPrice, style: _informationStyle,)
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Text(
                    place.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: place.imageUrls.map((e) =>
                        Padding(
                            padding: EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.network(e),
                            )
                        ),
                    ).toList()
                  ),
                )
              ],
            ),
          )
        )
    );
  }

}