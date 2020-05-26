import 'package:flutter/material.dart';
import 'card_profile_image.dart';

class CardProfileImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 300.0
      ),
      child: ListView(
        children: <Widget>[
          CardProfileImage("assets/img/rivendel.jpg", "Rivendel", "Hogar de los elfos", 16658),
          CardProfileImage("assets/img/comarca.jpg", "Comarca", "Hogar de los Hobbits", 56489),
          CardProfileImage("assets/img/rohan.jpg", "Rohan", "Hogar de Reyes", 54656),
        ],
      ),
    );
  }
}