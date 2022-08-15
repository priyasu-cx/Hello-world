import 'dart:async';
import 'package:connecten/provider/sign_in_provider.dart';
import 'package:connecten/view/home_screen.dart';
import 'package:connecten/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // init state
  @override
  void initState() {
    final sp = context.read<SignInProvider>();
    super.initState();

    Timer(Duration(seconds: 2), (() {
      sp.isSignedIn == false
          ? Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()))
          : Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }));
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Image.asset(
          Config.app_animation,
          width: _width * 0.5,
          height: _width * 0.5,
        ),
      )),
    );
  }
}
