import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  //Casos de uso del user
  //Caso 1: SigIn a la aplicación con Google
  Future<FirebaseUser>  signIn() {
    return _auth_repository.signInFirebase();
  }
  @override
  void dispose() {
    
  }

}