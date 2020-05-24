import 'package:flutter/material.dart';
import "review.dart";

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review("assets/img/people.jpg", "Jorge Aparicio", "8 reviews 3 photos", "Great place"),
        Review("assets/img/ann.jpg", "Pedro Álvarez", "10 reviews 5 photos", "Great place to go"),
        Review("assets/img/people.jpg", "Alejandro Martínez", "7 reviews 15 photos", "Great place to leave")
      ],    
    );
  }

}