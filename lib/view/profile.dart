import 'package:connecten/provider/connection_provider.dart';
import 'package:connecten/utils/colors.dart';
import 'package:connecten/view/Nav_Drawer/menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../provider/sign_in_provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final sp = context.read<SignInProvider>();
    final cp = context.read<ConnectionProvider>();

    return Scaffold(
        drawer: const Menu(),
        appBar: AppBar(
          toolbarHeight: Get.height * 0.12,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          shadowColor: primarybgcolor,
          elevation: 0.0,
          leading: Builder(
            builder: (context) => IconButton(
              splashRadius: 1,
              padding: const EdgeInsets.fromLTRB(30, 40, 0, 25),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: FaIcon(
                FontAwesomeIcons.bars,
                color: arrowcolor,
              ),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 25),
                height: Get.height * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: primarybgcolor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Container(
                      padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: Get.height*0.05,),
                          SlidingSwitch(
                            value: false,
                            width: 50,
                            onChanged: (bool value) {
                              if (value == true) {
                                cp.enableAdvertising(sp.uid);

                              } else {
                                cp.disableAdvertising();

                              }
                            },
                            height: 25,
                            animationDuration: const Duration(milliseconds: 400),
                            onTap: () {},
                            onDoubleTap: () {},
                            onSwipe: () {},
                            textOff: "",
                            textOn: "",
                            contentSize: 17,
                            colorOn: const Color(0xff035e00),
                            colorOff: const Color(0xfff00c0c),
                            background: const Color(0xff25ff00),
                            buttonColor: const Color(0xfff7f5f7),
                            inactiveColor: const Color(0xff636f7b),
                          ),
                          Text("Advertise", style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: 1),),
                        ],
                      )
                    ),
                    //Stack 1
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: Get.height*0.05,),
                          SlidingSwitch(
                            value: false,
                            width: 50,
                            onChanged: (bool value) {
                              if (value == true) {
                                cp.enableDiscovery(sp.uid);
                              } else {
                                cp.disableDiscovery();
                              }
                            },
                            height: 25,
                            animationDuration: const Duration(milliseconds: 400),
                            onTap: () {},
                            onDoubleTap: () {},
                            onSwipe: () {},
                            textOff: "",
                            textOn: "",
                            contentSize: 14,
                            colorOn: const Color(0xff035e00),
                            colorOff: const Color(0xfff00c0c),
                            background: const Color(0xff25ff00),
                            buttonColor: const Color(0xfff7f5f7),
                            inactiveColor: const Color(0xff636f7b),
                          ),
                          Text("Discover",style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: 1),),
                        ],
                      )
                    ),

                    //Stack 2
                    Container(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: Get.width * 0.1,
                            backgroundColor: primarybgcolor,
                            backgroundImage: AssetImage("assets/Avatar.png"),
                            foregroundImage: NetworkImage(sp.imageUrl!),
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            sp.fullname!,
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            sp.designation!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            sp.bio!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      alignment: Alignment.topCenter,
                    ),
                  ],
                ),
              ),
              Text(
                "My Links",
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          social(1, "assets/linkedin.png", "Linkedin", "link"),
                          social(2, "assets/github.png", "Github", "link"),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          social(1, "assets/website.png", "Portfolio", "link"),
                          social(2, "assets/twitter.png", "Twitter", "link"),
                        ]),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Text(
                      "Click to edit",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  // Future openDialog(image, text) => showDialog(
  //     context: context,
  //     builder: (context) =>AlertDialog(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(20),
  //       ),
  //       title: Text(text+" Link"),
  //       content: TextField(
  //         autofocus: true,
  //         decoration: InputDecoration(),
  //       ),
  //       actions: [
  //         TextButton(
  //             onPressed: (){},
  //             child: Text('SUBMIT')
  //         )
  //       ],
  //     )
  // );

  Widget social(index, image, text, link) {
    return Container(
      width: Get.width * 0.3,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xffeef7fe),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Container(
          //   alignment: Alignment.topRight,
          //   child: IconButton(
          //     alignment: Alignment.topRight,
          //     onPressed: () {
          //       openDialog(image, text);
          //     },
          //     icon: FaIcon(
          //       FontAwesomeIcons.penToSquare,
          //       color: arrowcolor,
          //     ),
          //     iconSize: 15,
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              openDialog(image, text);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  height: 25,
                  width: 25,
                ),
                SizedBox(height: Get.height * 0.01),
                Text(
                  text,
                  //textAlign: TextAlign.start,
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  openDialog(image, text) => showDialog(
        context: context,
        builder: (context) => Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 200,
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                        child: Column(children: [
                          Text(
                            text + " Link",
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextField(
                            autofocus: true,
                            decoration: InputDecoration(),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'SUBMIT',
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ))
                        ]))),
                Positioned(
                  child: CircleAvatar(
                    backgroundColor: Color(0xffced5ff),
                    radius: 50,
                    child: Image.asset(
                      image,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  top: -50,
                )
              ],
            )),
      );
}
