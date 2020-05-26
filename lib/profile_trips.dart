import 'package:flutter/material.dart';
import 'package:platzi_trips_app/gradient_back.dart';
import 'user_details.dart';
import 'card_profile_image_list.dart';

class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appbar = Stack(
      children: <Widget>[
        GradientBack("Profile", 380.0),
        UserDetails()
      ],
    );

    return Stack(
      children: <Widget>[
        appbar,
        CardProfileImageList()
      ],
    );
  }
}