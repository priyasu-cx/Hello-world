import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvider extends ChangeNotifier {
  // Instance of firebase auth, google
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  bool _hasError = false;
  bool get hasError => _hasError;

  String? _errorCode;
  String? get errorCode => _errorCode;

  String? _provider;
  String? get provider => _provider;

  String? _uid;
  String? get uid => _uid;

  String? _name;
  String? get name => _name;

  String? _email;
  String? get email => _email;

  String? _imageUrl;
  String? get imageUrl => _imageUrl;

  SignInProvider() {
    checkSignInUser();
  }

  Future checkSignInUser() async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    _isSignedIn = shared.getBool("signed_in") ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setBool("signed_in", true);
    _isSignedIn = true;
    notifyListeners();   
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      // Execute the authentication
      try {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // Signin in to firebase user instance
        final User userDetails =
            (await firebaseAuth.signInWithCredential(credential)).user!;

        // Save all details
        _name = userDetails.displayName;
        _email = userDetails.email;
        _imageUrl = userDetails.photoURL;
        _uid = userDetails.uid;

        notifyListeners();
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "account-exists-with-different-credential":
            _errorCode = "You already have an account with us";
            _hasError = true;
            notifyListeners();
            break;
          case "null":
            _errorCode = "Some unexpected error occurred";
            _hasError = true;
            notifyListeners();
            break;

          default:
            _errorCode = e.toString();
            _hasError = true;
            notifyListeners();
            break;
        }
      }
    } else {
      _hasError = true;
      notifyListeners();
    }
  }

  // Entry for cloud firestore
  Future getUserDataFromFirestore() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(_uid)
        .get()
        .then((DocumentSnapshot snapshot) async {
          _uid = snapshot["uid"];
          _name = snapshot["name"];
          _email = snapshot["email"];
          _imageUrl = snapshot["imageUrl"];
        });
  }

  Future saveDataToFirestore() async {
    final DocumentReference ref = FirebaseFirestore.instance.collection("users").doc(_uid);
    await ref.set({
      "name": _name,
      "email":_email,
      "uid":_uid,
      "imageUrl": _imageUrl,
    });
    notifyListeners();
  }

  // Save to shared preferences
  Future saveDataToSharedPreferences() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString("name", _name!);
    await sp.setString("email", _email!);
    await sp.setString("uid", _uid!);
    await sp.setString("imageUrl", _imageUrl!);
  }

  // Check if user exists or not
  Future<bool> chechUserExists() async {
    DocumentSnapshot snap =
        await FirebaseFirestore.instance.collection("users").doc(_uid).get();
    if (snap.exists) {
      print("Existing User");
      return true;
    } else {
      print("New User");
      return false;
    }
  }

  Future userSignOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
    _isSignedIn = false;
    notifyListeners();
    clearStoredData();
  }

  Future clearStoredData() async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    shared.clear();
  }
}
