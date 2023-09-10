import 'package:core/core.dart';
import 'package:domain/domain.dart';

class FirebaseAuthProvider {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  const FirebaseAuthProvider({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  Future<String> firebaseSignUp({
    required AuthorizationModel data,
  }) async {
    try {
      final UserCredential userCred =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: data.email,
        password: data.password,
      );
      return userCred.user != null ? userCred.user!.uid : '';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-exists') {
        print(
            'The provided email is already in use by an existing user. Each user must have a unique email.');
      } else if (e.code == 'invalid-email') {
        print(
            'The provided value for the email user property is invalid. It must be a string email address.');
      }
      return '';
    }
  }

  Future<String> firebaseSignIn({
    required AuthorizationModel data,
  }) async {
    try {
      final UserCredential userCred =
          (await _firebaseAuth.signInWithEmailAndPassword(
        email: data.email,
        password: data.password,
      ));
      return userCred.user != null ? userCred.user!.uid : '';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return '';
    }
  }

  Future<String> googleSignIn() async {
    final GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleAccount?.authentication;
    if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return (await _firebaseAuth.signInWithCredential(credential)).user!.uid;
    }
    return '';
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }
}
