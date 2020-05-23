import 'package:flutter/material.dart';
import "review.dart";

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Review("assets/people.jpg", "Jorge Aparicio", "8 reviews 3 photos", "Great place"),
        new Review("assets/people.jpg", "Pedro Álvarez", "10 reviews 5 photos", "Great place to go"),
        new Review("assets/people.jpg", "Alejandro Martínez", "7 reviews 15 photos", "Great place to leave")
      ],    
    );
  }

}