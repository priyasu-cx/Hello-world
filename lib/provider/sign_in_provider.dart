import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvider extends ChangeNotifier{

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  SignInProvider(){
    checkSignInUser();
  }

  Future checkSignInUser() async {
    final SharedPreferences shared = await SharedPreferences.getInstance();

    _isSignedIn = shared.getBool("signed_in") ?? false;

    notifyListeners();

  }

}