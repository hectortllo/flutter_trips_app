import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/User/repository/firebase_auth_api.dart';

class AuthRepository {
  final _firebaseAuthAPI = FireBaseAuthAPI();

  //Future son el equivalente a las promesas de JS 
  //En el Future viene un dato para su uso futuro, y en este caso es el 
  //de FirebaseUser
  Future<FirebaseUser> signInFirebase() => _firebaseAuthAPI.signIn();
}