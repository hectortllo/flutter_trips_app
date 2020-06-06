import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/button_purple.dart';

class DescriptionPlace extends StatelessWidget{
  final String namePlace;
  final int stars;
  final String descriptionPlace;

  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace);

  @override
  Widget build(BuildContext context) {

    /*final starHalf = Container(
      margin: EdgeInsets.only(
        top: 323.0,
        right: 3.0
      ),
      child: Icon(
        Icons.star_half,
        color: Color(0xFFf2C611),
      )
    );*/

    final starBorder = Container(
      margin: EdgeInsets.only(
        top: 353.0,
        right: 3.0
      ),
      child: Icon(
        Icons.star_border,
        color: Color(0xFFf2C611),
      )
    );

    final star = Container(
      margin: EdgeInsets.only(
        top: 353.0,
        right: 3.0
      ),
      child: Icon(
        Icons.star,
        color: Color(0xFFf2C611),
      ),
    );

    final description = Container(
      margin: EdgeInsets.only(
        top: 20.0,
        right: 20.0,
        left: 20.0
      ),
      child: new Text(
        descriptionPlace,
        style: const TextStyle(
          fontFamily: "Lato",
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF56575a)
        ),
        textAlign: TextAlign.justify,
      ),
    );

    final titleStars = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 350.0,
            left: 20.0,
            right: 20.0
          ),
          child: Text(
            namePlace,
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 30.0,
              fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          children: <Widget>[
            star,
            star,
            star,
            star,
            starBorder
          ],
        ),
      ],
    );
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        titleStars,
        description,
        ButtonPurple(
          buttonText: "Navigate",
          onPressed: null,
        )
      ],
    );
  } 
}