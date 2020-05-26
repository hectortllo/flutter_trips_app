import 'package:flutter/material.dart';
import 'floating_action_button_green.dart';

class CardProfileImage extends StatelessWidget {  
  String namePlace = "";
  String detailsPlace = "";
  int stepsPlace = 0;

  String pathImage = "assets/img/rivendel.jpg";
  CardProfileImage(this.pathImage, this.namePlace, this.detailsPlace, this.stepsPlace);
  @override
  Widget build(BuildContext context) {
    final steps = Container(
      margin: EdgeInsets.only(
        top: 5.0,
        left: 20.0
      ),
      child: Text(
        "Steps $stepsPlace",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 14.0,
          fontWeight: FontWeight.w900,
          color: Colors.amber
        ),
      ),
    );

    final details = Container(
      margin: EdgeInsets.only(
        top: 5.0,
        left: 20.0
      ),
      child: Text(
        detailsPlace,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 12.0,
          color: Color(0xFFa3a5a7)
        ),
      ),
    );

    final name = Container(
      margin: EdgeInsets.only(
        top: 10.0,
        left: 20.0
      ),
      child: Text(
        namePlace,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 18.0,
          fontWeight: FontWeight.bold
        ),
      ),
    );

    final description = Stack(
      children: <Widget>[
        Container(
          height: 100.0,
          width: 260.0,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            shape: BoxShape.rectangle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0)
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              name,
              details,
              steps
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 60.0,
            left: 190.0
          ),
          child: FloatingActionButtonGreen(),
        )
      ],
    );

    final card = Container(
      height: 240.0,
      width: 320.0,

      margin: EdgeInsets.only(
        bottom: 70.0
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(pathImage)
        ),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]
      )
    );

    return Stack(
      alignment: Alignment(0.0, 0.9),
      children: <Widget>[
        card,
        description
      ],
    );
  }
}