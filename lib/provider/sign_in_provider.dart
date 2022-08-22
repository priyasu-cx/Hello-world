import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get_storage/get_storage.dart';

class SignInProvider extends ChangeNotifier {
  final datacount = GetStorage();
  // Instance of firebase auth, google
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  bool _isFormDone = false;
  bool get isFormDone => _isFormDone;

  bool _hasError = false;
  bool get hasError => _hasError;

  String? _errorCode = "";
  String? get errorCode => _errorCode;

  String? _provider = "";
  String? get provider => _provider;

  String? _uid = "";
  String? get uid => _uid;

  String? _name = "";
  String? get name => _name;

  String? _email = "";
  String? get email => _email;

  String _imageUrl = "";
  String get imageUrl => _imageUrl;

  String _fullname = "";
  String get fullname => _fullname;

  String _designation = "";
  String get designation => _designation;

  String _bio = "";
  String get bio => _bio;

  String? _linkedIn = "";
  String? get linkedIn => _linkedIn;

  String? _github = "";
  String? get github => _github;

  String? _portfolio = "";
  String? get portfolio => _portfolio;

  String? _twitter = "";
  String? get twitter => _twitter;

  List<String?> _connectedList = [];
  List<String?> get connectedList => _connectedList;

  List<String?> _attendeeList = [];
  List<String?> get attendeeList => _attendeeList;



  SignInProvider() {
    checkSignInUser();
    readDataFromSharedPreferences();
  }

  Future setFormData(String name, String designation, String bio) async {

    _fullname = name;
    _designation = designation;
    _bio = bio;

    datacount.write("fullname", _fullname);
    datacount.write("designation", _designation);
    datacount.write("bio", _bio);
    notifyListeners();
  }

  Future setFormDone() async {

    datacount.write("form_done", true);
    _isFormDone = true;
    notifyListeners();
  }

  Future checkFormDone() async {

    _isFormDone = datacount.read("form_done") ?? false;
    notifyListeners();
  }

  Future checkSignInUser() async {

    _isSignedIn = datacount.read("signed_in") ?? false;
    notifyListeners();
  }

  Future setSignIn() async {

    datacount.write("signed_in", true);
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
        _imageUrl = userDetails.photoURL!;
        _uid = userDetails.uid;

        notifyListeners();
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "account-exists-with-different-credential":
            _errorCode = "You already have an account with us";
            _hasError = true;
            notifyListeners();
            break;
          default:
            _errorCode = "Some unexpected error occurred";
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

  Future setLinkedIn(String linkedInUrl) async {

    _linkedIn = linkedInUrl;
    datacount.write("linkedIn", _linkedIn ?? "");
    final DocumentReference ref =
        FirebaseFirestore.instance.collection("users").doc(_uid);
    await ref.update({
      "linkedIn": _linkedIn,
    });
    notifyListeners();
  }

  Future setGithub(String githubUrl) async {

    _github = githubUrl;
    //await sp.setString("github", _github??"");
    datacount.write("github", _github ?? "");
    final DocumentReference ref =
        FirebaseFirestore.instance.collection("users").doc(_uid);
    await ref.update({
      "github": _github,
    });
    notifyListeners();
  }

  Future setPortfolio(String portfolioUrl) async {

    _portfolio = portfolioUrl;
    // await sp.setString("portfolio", _portfolio??"");
    datacount.write("portfolio", _portfolio ?? "");
    final DocumentReference ref =
        FirebaseFirestore.instance.collection("users").doc(_uid);
    await ref.update({
      "portfolio": _portfolio,
    });
    notifyListeners();
  }

  Future setTwitter(String twitterUrl) async {

    _twitter = twitterUrl;
    // await sp.setString("twitter", _twitter??"");
    datacount.write("twitter", _twitter ?? "");
    final DocumentReference ref =
        FirebaseFirestore.instance.collection("users").doc(_uid);
    await ref.update({
      "twitter": _twitter!,
    });
    notifyListeners();
  }

  Future addConnection(String? uid) async {
    // final datacount = GetStorage();

    final DocumentReference ref =
        FirebaseFirestore.instance.collection("users").doc(_uid);
    await ref.get().then((DocumentSnapshot snapshot) {
      var connectedData = snapshot["connectedList"];
      _connectedList = List<String?>.from(connectedData);
    });
    if (_connectedList.contains(uid!) == false) {
      _connectedList.add(uid);
      await ref.update({"connectedList": _connectedList});
      datacount.write("connectedlist", _connectedList);
    }
    notifyListeners();
  }

  Future addToEvent(String? eventId) async {
    final DocumentReference ref =
        FirebaseFirestore.instance.collection("events").doc(eventId);
    await ref.get().then((DocumentSnapshot snapshot) {
      var eventData = snapshot["Attendees"];
      _attendeeList = List<String?>.from(eventData);
    });
    if (_attendeeList.contains(eventId!) == false) {
      _attendeeList.add(eventId);
      await ref.update({"Attendees": _attendeeList});
      datacount.write("Attendees", _attendeeList);
    }
    notifyListeners();
  }

  Future getConnectionList(String? uid) async {
    // final datacount = GetStorage();
    final DocumentReference ref =
        FirebaseFirestore.instance.collection("users").doc(_uid);
    await ref.get().then((DocumentSnapshot snapshot) {
      var connectedData = snapshot["connectedList"];
      _connectedList = List<String?>.from(connectedData);
    });
    datacount.write("connectedlist", _connectedList);
    notifyListeners();
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
      _linkedIn = snapshot["linkedIn"];
      _github = snapshot["github"];
      _portfolio = snapshot["portfolio"];
      _twitter = snapshot["twitter"];
      var connectedData = snapshot["connectedList"];
      _connectedList = connectedData.cast<String?>();
    });
    notifyListeners();
  }

  Future getAttendees(String? eventId) async {
    await FirebaseFirestore.instance
        .collection("events")
        .doc(eventId)
        .get()
        .then((DocumentSnapshot snapshot) async {
      var attendeeData = snapshot["Attendees"];
      _attendeeList = attendeeData.cast<String?>();
    });
  }

  Future<Map<String, String?>> fetchUserDataFirestore(String uid) async {
    var userData = new Map<String, String?>();

    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get()
        .then((DocumentSnapshot snapshot) async {
      userData["fullname"] = snapshot["fullname"];
      userData["designation"] = snapshot["designation"];
      userData["bio"] = snapshot["bio"];
      userData["imageUrl"] = snapshot["imageUrl"];
      userData["linkedIn"] = snapshot["linkedIn"];
      userData["github"] = snapshot["github"];
      userData["portfolio"] = snapshot["portfolio"];
      userData["twitter"] = snapshot["twitter"];
      userData["connectedList"] = snapshot["connectedList"];
    });

    return userData;
  }

  Future getFormDataFromFirestore() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(_uid)
        .get()
        .then((DocumentSnapshot snapshot) async {
      _fullname = snapshot["fullname"];
      _designation = snapshot["designation"];
      _bio = snapshot["bio"];
    });
  }

  Future saveDataToFirestore() async {
    final DocumentReference ref =
        FirebaseFirestore.instance.collection("users").doc(_uid);
    await ref.set({
      "name": _name,
      "email": _email,
      "uid": _uid,
      "imageUrl": _imageUrl,
      "linkedIn": _linkedIn,
      "github": _github,
      "portfolio": _portfolio,
      "twitter": _twitter,
      "connectedList": _connectedList,
    });
    notifyListeners();
  }

  Future saveFormDataToFirestore() async {
    final DocumentReference ref =
        FirebaseFirestore.instance.collection("users").doc(_uid);
    await ref.update({
      "fullname": _fullname,
      "designation": _designation,
      "bio": _bio,
    });
    notifyListeners();
  }

  // Save to shared preferences
  Future saveDataToSharedPreferences() async {
    await datacount.write("name", _name ?? "");
    await datacount.write("email", _email ?? "");
    await datacount.write("uid", _uid ?? "");
    await datacount.write("imageUrl", _imageUrl);
    await datacount.write("linkedIn", _linkedIn ?? "");
    await datacount.write("github", _github ?? "");
    await datacount.write("portfolio", _portfolio ?? "");
    await datacount.write("twitter", _twitter ?? "");
  }

  Future readDataFromSharedPreferences() async {
    _name = datacount.read("name");
    _email = datacount.read("email");
    _uid = datacount.read("uid");
    _imageUrl = datacount.read("imageUrl");
    _linkedIn = datacount.read("linkedIn");
    _github = datacount.read("github");
    _portfolio = datacount.read("portfolio");
    _twitter = datacount.read("twitter");
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
    // datacount.erase();
    datacount.remove("name");
    datacount.remove("email");
    datacount.remove("email");
    datacount.remove("uid");
    datacount.remove("imageUrl");
    datacount.remove("linkedIn");
    datacount.remove("github");
    datacount.remove("portfolio");
    datacount.remove("twitter");
  }
}
