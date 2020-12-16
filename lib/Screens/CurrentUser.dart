import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sharekiitstarter/DatabaseManager/dbfuture.dart';
import 'package:sharekiitstarter/Model/UserModel.dart';
import 'package:sharekiitstarter/Model/authmodel.dart';

class Auth {
  firebaseAuth.FirebaseAuth _auth = firebaseAuth.FirebaseAuth.instance;
  FirebaseMessaging _fcm = FirebaseMessaging();

  Stream<AuthModel> get user {
    return _auth.authStateChanges().map(
          // ignore: deprecated_member_use
          (firebaseAuth.User firebaseUser) => (firebaseUser != null)
              ? AuthModel.fromFirebaseUser(user: firebaseUser)
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

  Future<String> signUpUser(String email, String password, String name) async {
    String retVal = "error";
    try {
      firebaseAuth.UserCredential _authResult = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel _user = UserModel(
        uid: _authResult.user.uid,
        email: _authResult.user.email,
        name: name,
        accountCreated: Timestamp.now(),
        notifToken: await _fcm.getToken(),
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
      await _auth.signInWithEmailAndPassword(email: email, password: password);
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
      final firebaseAuth.AuthCredential credential =
          firebaseAuth.GoogleAuthProvider.credential(
              idToken: _googleAuth.idToken,
              accessToken: _googleAuth.accessToken);
      firebaseAuth.UserCredential _authResult =
          await _auth.signInWithCredential(credential);
      if (_authResult.additionalUserInfo.isNewUser) {
        UserModel _user = UserModel(
          uid: _authResult.user.uid,
          email: _authResult.user.email,
          name: _authResult.user.displayName,
          accountCreated: Timestamp.now(),
          notifToken: await _fcm.getToken(),
        );
        String _returnString = await DBFuture().createUser(_user);
        if (_returnString == "success") {
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
