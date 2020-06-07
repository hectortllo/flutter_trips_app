import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_app/Place/ui/screens/add_place_screen.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: <Widget>[
            //Cambiar contraseña
            CircleButton(true, Icons.vpn_key, 20.0, Color.fromRGBO(255, 255, 255, 0.6),
              () => {}),
            //Añadir nuevo lugar
            CircleButton(false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1), 
              () {
                Future getImage() async {
                  File image = await ImagePicker.pickImage(
                    source: ImageSource.camera
                  ).catchError((onError) => print(onError));
                  if(image != null){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (BuildContext context) => AddPlaceScreen(image: image, camera: true,)
                      )
                    );
                  }
                }
                Future<void> retrieveData() async {
                  final LostDataResponse response = await ImagePicker.retrieveLostData();
                  if(response == null){
                    return;
                  }
                  if(response.file != null){
                    print("********************** FUNCIONÓ ************************");
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (BuildContext context) => AddPlaceScreen(image: response.file,)
                      )
                    );
                  }
                }
                getImage();
                retrieveData();
              }),
            //Cerrar sesión
            CircleButton(true, Icons.exit_to_app, 20.0, Color.fromRGBO(255, 255, 255, 0.6),
              () => {
                userBloc.signOut()
              }),
          ],
        )
    );
  }

}