import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/login.png",
            width: _width,
            alignment: Alignment.topCenter,
            scale: 0.8,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: _width * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Welcome to",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  "ConnecTen",
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "\nBest cloud storage platform for all \nbusiness and individuals to \nmanage there data.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "\nJoin For Free.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: _width * 0.11,
              vertical: _width * 0.05,
            ),
            child: Material(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.center,
                height: _width * 0.1,
                decoration: const BoxDecoration(
                  color: Color(0xff567DF4),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Image.asset("assets/google.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
