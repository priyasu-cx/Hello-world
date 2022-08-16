import 'package:connecten/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: Get.height * 0.12,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: primarybgcolor,
        elevation: 0.0,
        leading: IconButton(
          padding: const EdgeInsets.fromLTRB(30, 40, 0, 25),
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.chevronLeft,
            color: arrowcolor,
          ),
          alignment: Alignment.centerLeft,
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
                    height: 20,
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
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(
                        "Profile Name",
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
                        "Designation",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare pretium placerat ut platea.",
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
            ),textAlign: TextAlign.left,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      social(1, "assets/linkedin.png", "Linkedin", "link"),
                      social(2, "assets/github.png", "Github", "link"),
                    ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      social(1, "assets/website.png", "Portfolio", "link"),
                      social(2, "assets/google1.png", "Google +", "link"),
                    ]
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget social(index, image, text, link){
    return Container(

      width: Get.width*0.3,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xffeef7fe),
        borderRadius: BorderRadius.circular(20),

      ),
      child: Column(
        children:[
          Image.asset(image,height: 40,width: 40,),
          Text(text),
        ],
      ),
    );
  }

}