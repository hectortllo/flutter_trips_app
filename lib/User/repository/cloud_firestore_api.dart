import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_place.dart';

class CloudFirestoreApi {
  final String USERS = "users";
  final String PLACES = "places";

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(User user) async{
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, merge: true);
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);
    FirebaseUser user = await _auth.currentUser();
    DocumentReference _userRef = _db.collection(USERS).document(user.uid);
    return refPlaces.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'urlImage': place.urlImage,
      'userOwner': _userRef
    }).then((DocumentReference dr) {
      dr.get().then((DocumentSnapshot snapshot){
        print("*****************************************");
        print(_db.document("$PLACES/${snapshot.documentID}"));
        _userRef.updateData({
          'myPlaces': FieldValue.arrayUnion([_db.document("$PLACES/${snapshot.documentID}")])
        });
      });
    });
  }

  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesListSnapshot){
    List<ProfilePlace> profilePlaces = List<ProfilePlace>();
    placesListSnapshot.forEach((p) {
      profilePlaces.add(ProfilePlace(
        Place(name: p.data['name'], 
          description: p.data['description'],
          urlImage: p.data['urlImage']
        )
      ));
    });
    return profilePlaces;
  }
}
