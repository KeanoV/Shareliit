import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sharekiitstarter/DatabaseManager/dbfuture.dart';
import 'package:sharekiitstarter/Model/UserModel.dart';
import 'package:sharekiitstarter/sharedprefs.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var firestore = FirebaseFirestore.instance;

  getCurrentUser() async {
    return _auth.currentUser;
  }

  Stream<UserModel> get user {
    return _auth.authStateChanges().map(
          // ignore: deprecated_member_use
          (User firebaseUser) => (firebaseUser != null)
              ? UserModel.fromFirebaseUser(user: firebaseUser)
              : null,
        );
  }

  Future<String> signOut() async {
    String retVal = "error";

    try {
      await _auth.signOut();
      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> signUpUser(
      String email, String password, String fullName) async {
    String retVal = "error";
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      UserModel _user = UserModel(
        uid: _authResult.user.uid,
        email: _authResult.user.email,
        name: fullName.trim(),
        accountCreated: Timestamp.now(),
      );
      String _returnString = await DBFuture().createUser(_user);
      if (_returnString == "success") {
        retVal = "success";
      }
    } on PlatformException catch (e) {
      retVal = e.message;
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<String> loginUserWithEmail(String email, String password) async {
    String retVal = "error";

    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
    } on PlatformException catch (e) {
      retVal = e.message;
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<String> loginUserWithGoogle() async {
    String retVal = "error";
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    try {
      GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);
      UserCredential _authResult = await _auth.signInWithCredential(credential);
      if (_authResult.additionalUserInfo.isNewUser) {
        UserModel _user = UserModel(
          uid: _authResult.user.uid,
          email: _authResult.user.email,
          name: _authResult.user.displayName,
          accountCreated: Timestamp.now(),
        );
        String _returnString = await DBFuture().createUser(_user);
        if (_returnString == "success") {
          retVal = "success";
          SharedPreferenceHelper()
              .saveDisplayName(_authResult.user.displayName);
          SharedPreferenceHelper().saveUserEmail(_authResult.user.email);
          SharedPreferenceHelper().saveUserId(_authResult.user.uid);
          SharedPreferenceHelper()
              .saveUserProfileUrl(_authResult.user.photoURL);

          retVal = "success";
        }
      }
      retVal = "success";
    } on PlatformException catch (e) {
      retVal = e.message;
    } catch (e) {
      print(e);
    }

    return retVal;
  }
}
