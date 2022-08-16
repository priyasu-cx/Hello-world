import 'package:connecten/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/login.png",
            width: _width,
            // alignment: Alignment.topCenter,
            scale: 0.8,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: _width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Welcome to",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Text(
                    "ConnecTen",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Text(
                    "\nBest community connection platform \nfor all meetups and events to \nconnect hassle free.",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    "\nJoin For Free.",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      // horizontal: _width * 0.11,
                      vertical: _height * 0.08,
                    ),
                    child: Material(
                      color: Color(0xff567DF4),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: InkWell(
                        onTap: () {
                          Get.to(Profile());
                          print("Sign In tapped.");
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          alignment: Alignment.center,
                          height: _width * 0.1,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            
                          ),
                          child: Image.asset("assets/google.png"),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: _height * 0.05,
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
