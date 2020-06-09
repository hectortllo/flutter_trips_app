import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/repository/firebase_storage_repository.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_repository.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_place.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();

  //Flujo de datos (Stream) proveniente de Firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;

  //Devuelve el estado de la sesión
  Stream<FirebaseUser> get authStatus => streamFirebase;

  //Obtener el id del user
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  final _firebaseStorageRepository = FirebaseStorageRepository();
  Future<StorageUploadTask> uploadFile(String path, File image)
    => _firebaseStorageRepository.uploadFile(path, image);
  //Casos de uso del user
  //Caso 1: SigIn a la aplicación con Google
  Future<FirebaseUser>  signIn() =>  _authRepository.signInFirebase();

  //Caso 2: SingOut
  signOut(){
    _authRepository.signOut();
  }

  //Caso 3: Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  Future<void> updatePlaceData(Place place) => _cloudFirestoreRepository.updatePlaceData(place);
  Stream<QuerySnapshot> placesListStream = Firestore.instance.collection(CloudFirestoreApi().PLACES).snapshots();
  Stream<QuerySnapshot> get placeStream => placesListStream;
  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreRepository.buildPlaces(placesListSnapshot);

  @override
  void dispose() {
    
  }

}