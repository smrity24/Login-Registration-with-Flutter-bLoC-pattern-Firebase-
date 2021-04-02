import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//
  UserRepository({this.firebaseAuth});

  // Sign Up with email and password

  Future<User> signUp(String email, String password) async {
    try {
      var auth = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return auth.user;
    } catch (e) {
      print(e.toString());
    }
  }

  // Sign In with email and password

  Future<User> signIn(String email, String password) async {
    try {
      var auth = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return auth.user;
    } catch (e) {
      print(e.toString());
    }
  }

  // Sign Out

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  // check Sign In
  Future<bool> isSignedIn() async {
    var currentUser = await firebaseAuth.currentUser;
    return currentUser != null;
  }

  //get current user

  Future<User> getCurrentUser() async {
    return await firebaseAuth.currentUser;
  }
}
