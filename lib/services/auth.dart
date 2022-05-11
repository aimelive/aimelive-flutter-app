import 'package:aimelive_app/models/app_user.dart';
import 'package:aimelive_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//create user object based
  AppUser? _appUser(User? userInfo) {
    return userInfo != null ? AppUser(uuid: userInfo.uid) : null;
  }

  //auth change user stream
  Stream<AppUser?> get user {
    return _auth.authStateChanges().map(_appUser);
  }

  // //sign in with Email & Password
  Future signIn(String email, String password) async {
    try {
      UserCredential response = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? userInfo = response.user;
      return _appUser(userInfo);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //register with Email & Password
  Future registerWithEmailAndPassword(
      String email,
      String password,
      String fullName,
      String phone,
      String avatar,
      String username,
      String bio) async {
    try {
      UserCredential response = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? userCreated = response.user;

      //create a new document for the user with uuid
      await DatabaseService(uuid: userCreated!.uid)
          .createUserProfile(email, fullName, phone, avatar, username, bio);
      return _appUser(userCreated);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //signout
  Future logOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
