
import 'package:flutter/material.dart';
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
                              image: 'https://www.themealdb.com/images/media/meals/ryppsv1511815505.jpg')
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
                          'BeaverTails',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            fontFamily: 'Oxygen',
                          ),
                        ),
                        SizedBox(height: 7,),
                        Text(
                          'Dessert',
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
                                unescape.convert('In the bowl of a stand mixer, add warm water, a big pinch of sugar and yeast. Allow to sit until frothy.\r\nInto the same bowl, add 1/2 cup sugar, warm milk, melted butter, eggs and salt, and whisk until combined.\r\nPlace a dough hook on the mixer, add the flour with the machine on, until a smooth but slightly sticky dough forms.\r\nPlace dough in a bowl, cover with plastic wrap, and allow to proof for 1 1/2 hours.\r\nCut dough into 12 pieces, and roll out into long oval-like shapes about 1/4 inch thick that resemble a beaver’s tail.\r\nIn a large, deep pot, heat oil to 350 degrees. Gently place beavertail dough into hot oil and cook for 30 to 45 seconds on each side until golden brown.\r\nDrain on paper towels, and garnish as desired. Toss in cinnamon sugar, in white sugar with a squeeze of lemon, or with a generous slathering of Nutella and a handful of toasted almonds. Enjoy!'),
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