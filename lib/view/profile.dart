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
      body: Column(
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
                //Stack 1
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  alignment: Alignment.topRight,
                  child: SlidingSwitch(
                    value: false,
                    width: 50,
                    onChanged: (bool value) {
                      print(value);
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
                    ])
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget social(index, image, text, link) {
    return Container(
      width: Get.width * 0.3,
      padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xffeef7fe),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: IconButton(
              alignment: Alignment.topRight,
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.penToSquare,
                color: arrowcolor,
              ),
              iconSize: 15,
            ),
          ),
          Column(
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
          )
        ],
      ),
    );
  }
}
