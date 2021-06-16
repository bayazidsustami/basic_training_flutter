import 'package:flutter/material.dart';
import 'package:flutter_learn/model/tourism_place.dart';

var _informationStyle = TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget{

  final TourismPlace place;

  DetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if(constraints.maxWidth > 800){
            return DetailWebPage(place: place,);
          } else{
            return DetailMobilePage(place: place,);
          }
        }
    );
  }
}

class DetailMobilePage extends StatelessWidget{
  final TourismPlace place;

  const DetailMobilePage({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Image.asset(place.imageAsset),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(onPressed: ()  =>
                              Navigator.pop(context),
                              icon: Icon(Icons.arrow_back)),
                          FavoriteButton(),
                        ],
                      ),
                    ],
                  ),
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

class DetailWebPage extends StatefulWidget{

  final TourismPlace place;

  const DetailWebPage({required this.place});

  @override
  _DetailWebPageState createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
        child: Center(
          child: Container(
            width: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wisata Bandung',
                  style: TextStyle(
                    fontFamily: 'Staatliches',
                    fontSize: 32,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ClipRRect(
                            child: Image.asset(widget.place.imageAsset),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          SizedBox(height: 16),
                          Container(
                            height: 150,
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Scrollbar(
                              isAlwaysShown: true,
                              controller: _scrollController,
                              child: ListView(
                                controller: _scrollController,
                                padding: const EdgeInsets.only(bottom: 16),
                                scrollDirection: Axis.horizontal,
                                children: widget.place.imageUrls.map((url) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(url),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 32,),
                    Expanded(
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    widget.place.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        fontFamily: 'Staatliches'
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.calendar_today),
                                        SizedBox(width: 8.0),
                                        Text(
                                          widget.place.openDays,
                                          style: _informationStyle,
                                        ),
                                      ],
                                    ),
                                    FavoriteButton()
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.access_time),
                                    SizedBox(width: 8.0),
                                    Text(
                                      widget.place.openTime,
                                      style: _informationStyle,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.0,),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.monetization_on),
                                    SizedBox(width: 8.0),
                                    Text(
                                      widget.place.ticketPrice,
                                      style: _informationStyle,
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 16.0),
                                  child: Text(
                                    widget.place.description,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Oxygen'
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                    )
                  ],
                )
              ],
            ),
          ),
        )
      )
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class FavoriteButton extends StatefulWidget{
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();

}

class _FavoriteButtonState extends State<FavoriteButton>{

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
      setState(() {
        isFavorite = !isFavorite;
      });
    }, icon: Icon(
      isFavorite ? Icons.favorite : Icons.favorite_border,
      color: Colors.red,
    ));
  }

}