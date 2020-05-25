import 'package:flutter/material.dart';
import 'floating_action_button_green.dart';

class CardProfileImage extends StatelessWidget {
  String pathImage = "assets/img/rivendel.jpg";
  String titleCard = "";
  String description = "";
  int steps = 0;

  CardProfileImage(this.titleCard, this.description, this.pathImage, this.steps);
  
  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: 250.0,
      width: 450.0,
      margin: EdgeInsets.only(
        top: 300.0,
        left: 20.0,
        right: 20.0
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(pathImage)
        ),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]
      ),
    );

    final cardDetail = Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                card,
                Container(
                  height: 100.0,
                  width: 290.0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        titleCard,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w900
                        ),
                      ),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                      Text(
                        "Steps $steps",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.amber
                        ),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(
                    left: 40.0,
                    top: 500.0
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    boxShadow: <BoxShadow> [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 15.0,
                        offset: Offset(0.0, 0.7)
                      )
                    ]
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 570.0,
                    left: 270.0
                  ),
                  child: FloatingActionButtonGreen(),
                )
              ],
            )
          ],
        )
      ],
    );

    return cardDetail;
  }
}