import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FloatingActionButtonGreen();
  }
  
}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {
  bool favorito = false;
  String texto = "";

  void onPressedFav(){
    setState(() {
      return favorito = !favorito;
    });
    setState(() {
      if(favorito){
        texto = "Eliminado de favoritos";
      }else {
        texto = "Agregado a favoritos";
      }
      return texto;
    });
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(texto),
      )
    );
  }

  Widget icono(){
    if(favorito){
      return Icon(
        Icons.favorite_border
      );
    }else {
      return Icon(
        Icons.favorite
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: onPressedFav,
      child: icono()
    );
  }

}