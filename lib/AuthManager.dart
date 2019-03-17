import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthManager{
  static final AuthManager _SigninManager = new AuthManager._internal();
  AuthManager instance() => _SigninManager;
  AuthManager._internal();

  FirebaseUser currUser;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<FirebaseUser> handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user = await _auth.signInWithCredential(credential);

    currUser = user;
    return user;
  }


  factory AuthManager(){
    return _SigninManager;
  }
}