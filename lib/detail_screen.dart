
import 'package:flutter/material.dart';
import 'package:flutter_learn/model/detail_meals_model.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailScreen extends StatelessWidget{

  final String idMeal;

  DetailScreen({required this.idMeal});

  var unescape = HtmlUnescape();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context,  BoxConstraints constraints){
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          child : FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: getDetail(idMeal).mealImg)
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back)
                          ),
                        ),
                      ),
                      Positioned(
                          right: 50.0,
                          top: 340.0,
                          child: FavoriteButton()
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          getDetail(idMeal).mealName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            fontFamily: 'Oxygen',
                          ),
                        ),
                        SizedBox(height: 7,),
                        Text(
                          getDetail(idMeal).mealCategory,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Oxygen',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Instructions :',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontFamily: 'Oxygen',
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                unescape.convert(getDetail(idMeal).instructions),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Oxygen',
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        )
      )
    );
  }

  DetailMealsModel getDetail(String idMeal){
    for(var items in listDetailMeal){
      if(items.idMeal == idMeal){
        return items;
      }
    }
    throw new Exception('unexpected id');
  }
}

class FavoriteButton extends StatefulWidget{
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {

  var isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: Icon(
        Icons.favorite,
        size: 60,
        color: isFavorite ? Colors.red : Colors.blueGrey,),
    );
  }
}