import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn =  GoogleSignIn();

  Future<FirebaseUser> signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    //Abrir la ventana de inicio de sesión y pedir credenciales
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    //Autenticación con firebase
    FirebaseUser user = _auth.signInWithCredential(
      GoogleAuthProvider.getCredential(idToken: gSA.idToken, accessToken: gSA.accessToken)) as FirebaseUser;
      return user;
  }
}