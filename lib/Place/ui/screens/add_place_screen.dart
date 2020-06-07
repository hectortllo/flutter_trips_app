import 'dart:io';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_trips_app/widgets/button_purple.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/text_input.dart';
import 'package:platzi_trips_app/widgets/title_header.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';

class AddPlaceScreen extends StatefulWidget {

  File image;
  bool camera = false;
  AddPlaceScreen({
    Key key,
    this.image,
    this.camera
  });

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _controllerTitlePlace = TextEditingController();
  final _controllerDescriptionPlace = TextEditingController();
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(
            heightGradient: 300.0,
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 25.0,
                  left: 5.0
                ),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 45.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 45.0,
                    left: 20.0,
                    right: 10.0
                  ),
                  child: TitleHeader(title: "Add a new Place"),
                )
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: 120.0,
              bottom: 20.0
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(
                    pathImage: widget.image.path,
                    iconData: Icons.camera_alt,
                    width: 300.0,
                    height: 250.0, 
                    image: widget.image,
                    left: 0.0,
                    onPressedFabIcon: null,
                    camera: widget.camera,
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20.0,
                    bottom: 20.0
                  ),
                  child: TextInput(
                    hintText: "Title", 
                    inputType: null, 
                    controller: _controllerTitlePlace,
                    maxLines: 1,
                  ),
                ),
                TextInput(
                  hintText: "Description", 
                  inputType: TextInputType.multiline, 
                  controller: _controllerDescriptionPlace,
                  maxLines: 4,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20.0
                  ),
                  child: TextInputLocation(
                    hintText: "Add Location", 
                    iconData: Icons.location_on, 
                    controller: null,
                  ),
                ),
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                    buttonText: "Add Place", 
                    onPressed: () {
                      //1. Firebase Storage
                      //Url

                      //2. Cloud firestore
                      //Place -> título, descripción, url, userOwner, likes
                      userBloc.updatePlaceData(Place(
                        name: _controllerTitlePlace.text,
                        description: _controllerDescriptionPlace.text,
                        likes: 0,
                        urlImage: null,
                        userOwner: null,
                      )).whenComplete(() {
                        print("Terminó");
                        Navigator.pop(context);
                      });
                    }
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}