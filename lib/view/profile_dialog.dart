import 'package:connecten/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// void ProfileDialog(BuildContext context) {
//   showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//             title: new Text("title"),
//             content: new Text("body"),
//             actions: <Widget>[
//               new TextButton(
//                 child: new Text("close"),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               )
//             ]);
//       });
// }

Future ProfileDialog(uid, context) => showDialog(
    context: context,
    builder: (context) =>AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      //title: Text(uid+" Link"),
      content: SingleChildScrollView(child: Column(
        children: [
          CircleAvatar(
            radius: Get.width * 0.1,
            backgroundColor: primarybgcolor,
            backgroundImage: AssetImage("assets/Avatar.png"),
            //foregroundImage: sp.imageUrl == null ? AssetImage("assets/Avatar.png") : NetworkImage(sp.imageUrl),
            //foregroundImage: NetworkImage(sp.imageUrl!),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(
            "Social Links",
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                social_link(context, 1, "assets/linkedin.png", "Linkedin", "link"),
                social_link(context, 2, "assets/github.png", "Github", "link"),
                social_link(context,3, "assets/website.png", "Portfolio", "link"),
                social_link(context,4, "assets/twitter.png", "Twitter", "link"),
                // Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       social_link(context, 1, "assets/linkedin.png", "Linkedin", "link"),
                //       social_link(context, 2, "assets/github.png", "Github", "link"),
                //     ]),
                // Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       social_link(context,3, "assets/website.png", "Portfolio", "link"),
                //       social_link(context,4, "assets/twitter.png", "Twitter", "link"),
                //     ]),
              ],
            ),
          )
        ],
      ),)
    )
);
Widget social_link(context, index, image, text, link) {
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
