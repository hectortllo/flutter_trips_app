import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn =  GoogleSignIn();

  //Inicio de sesión 
  Future<FirebaseUser> signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    //Abrir la ventana de inicio de sesión y pedir credenciales
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    //Autenticación con firebase
    FirebaseUser user = (await _auth.signInWithCredential(
      GoogleAuthProvider.getCredential(idToken: gSA.idToken, accessToken: gSA.accessToken)
    )).user;

    return user;
  }

  //Cerrar sesión
  signOut() async {
    //Cerrando sesión en firebase
    await _auth.signOut().then((onvalue) => print("Sesión cerrada"));
    //Cerrando sesión en google
    googleSignIn.signOut();
    print("Sesiones cerradas");
  }

}