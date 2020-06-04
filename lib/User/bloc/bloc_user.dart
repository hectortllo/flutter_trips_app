import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();

  //Flujo de datos (Stream) proveniente de Firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;

  //Devuelve el estado de la sesión
  Stream<FirebaseUser> get authStatus => streamFirebase;

  //Casos de uso del user
  //Caso 1: SigIn a la aplicación con Google
  Future<FirebaseUser>  signIn() {
    return _authRepository.signInFirebase();
  }

  //Caso 2: SingOut
  signOut(){
    _authRepository.signOut();
  }

  //Caso 3: Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  
  @override
  void dispose() {
    
  }

}