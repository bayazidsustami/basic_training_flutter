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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          if(constraints.maxWidth <= 600){
            return TourismPlaceList();
          } else if (constraints.maxWidth <= 1200){
            return TourismPlaceGrid(gridCount: 4);
          } else{
            return TourismPlaceGrid(gridCount: 6);
          }
        },
      )
    );
  }
}

class TourismPlaceList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index){
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
    );
  }
}

class TourismPlaceGrid extends StatelessWidget{

  final int gridCount;

  TourismPlaceGrid({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Scrollbar(
        isAlwaysShown: true,
        child: GridView.count(
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: gridCount,
            children: tourismPlaceList.map((e) => InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(place: e)));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset(
                        e.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        e.name,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text(
                        e.location,
                      ),
                    ),
                  ],
                ),
              ),
            )).toList()
        ),
      )
    );
  }

}