import 'package:flutter/material.dart';
import 'package:platzi_trips_app/gradient_back.dart';
import 'user_details.dart';
import 'card_profile_image.dart';

class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appbar = Stack(
      children: <Widget>[
        GradientBack("Profile", 400.0),
        UserDetails()
      ],
    );

    return Stack(
      children: <Widget>[
        appbar,
        CardProfileImage("Rivendel", "Ciudad de los elfos", "assets/img/rivendel.jpg", 13525)
        
      ],
    );
  }
}