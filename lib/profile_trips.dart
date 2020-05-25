import 'package:flutter/material.dart';
import 'package:platzi_trips_app/gradient_back.dart';
import 'user_details.dart';

class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GradientBack("Profile", 400.0),
        UserDetails()
      ],
    );
  }
}