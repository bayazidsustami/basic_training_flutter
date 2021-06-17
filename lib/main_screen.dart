import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Meal Catalogue',
                      style: TextStyle(
                          fontFamily: 'Oxygen',
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: LayoutBuilder(
                      builder: (BuildContext context,  BoxConstraints constraints){
                        if(constraints.maxWidth <= 600){
                          return ItemGrid(countGridItem: 2);
                        } else if(constraints.maxWidth <= 1200){
                          return ItemGrid(countGridItem: 4);
                        } else{
                          return ItemGrid(countGridItem: 6);
                        }
                      }
                  )
              )
            ],
          )
      ),
    );
  }
}

class ItemGrid extends StatelessWidget{

  final int countGridItem;

  ItemGrid({required this.countGridItem});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
        itemCount: 20,
        crossAxisCount: countGridItem,
        itemBuilder: (context, index) =>
            MainItem(mealName: 'Ikan'),
        staggeredTileBuilder: (count) =>
            StaggeredTile.count(1, count.isEven ? 1.2 : 1.4)
    );
  }
}

class MainItem extends StatelessWidget {
  final String mealName;

  MainItem({required this.mealName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: 'https://www.themealdb.com/images/media/meals/1548772327.jpg',
                      fit: BoxFit.cover,
                  )
              ),
          ),
          SizedBox(height: 7,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  flex: 3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.blueGrey,
                      ),
                      Text(
                        '1200',
                        style: TextStyle(
                          fontFamily: 'Oxygen',
                          color: Colors.blueGrey
                        ),
                      )
                    ],
                  )
              ),
              Expanded(
                  flex: 1,
                  child: BookmarkButton()
              )
            ],
          )
        ],
      ),
    );
  }
}

class BookmarkButton extends StatefulWidget{
  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {

  var isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){
          setState(() {
            isBookmarked = !isBookmarked;
          });
        },
        icon: Icon(
          isBookmarked ? Icons.bookmark : Icons.book,
          color: Colors.blueGrey,
        )
    );
  }
}
