import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final photo = Container(
    margin: EdgeInsets.only(
      top: 130.0,
      left: 20.0
    ),
    width: 80.0,
    height: 80.0,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/img/profile.jpg"),
        ),
        border: Border.all(
          width: 2.0, 
          color: Colors.white
        )
      ),
    );

    final userName = Container(
      margin: EdgeInsets.only(
        top: 140.0,
        left: 20.0
      ),
      child: Text(
        "Héctor Tello",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
          fontFamily: "Lato"
        ),
      ),
    );

    final userEmail = Container(
      margin: EdgeInsets.only(
        top: 0.0,
        left: 20.0
      ),
      child: Text(
        "hectortllo@gmail.com",
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.white24,
          fontSize: 14.0,
          fontFamily: "Lato"
        ),
      ),
    );

    final user = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        userEmail
      ],
    );

    final userInformation = Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            photo,
            user
          ],
        )
      ],
    );

    Widget createIcon(IconData iconData, double height, 
      double weight, Color color){
      return Container(
        margin: EdgeInsets.only(
          top: 30.0,
          right: 15.0,
          left: 15.0
        ),
        height: height,
        width: weight,
        child: Icon(
          iconData,
          color: Color(0xFF584CD1),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color
        ),
      );
    }

    final icons = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 20.0,
            left: 2.0,
            right: 2.0
          ),
        ),
        Row(
          children: <Widget>[
            createIcon(Icons.bookmark_border, 35.0, 35.0, Colors.white),
            createIcon(Icons.card_giftcard, 35.0, 35.0, Colors.white54),
            createIcon(Icons.add, 60.0, 60.0, Colors.white),
            createIcon(Icons.mail_outline, 35.0, 35.0, Colors.white54),
            createIcon(Icons.person, 35.0, 35.0, Colors.white54),
          ],
        )
      ],
    );

    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            userInformation,
            icons
          ],
        )
      ],
    );
  }
}