import 'package:connecten/utils/colors.dart';
import 'package:connecten/view/Nav_Drawer/menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NearbyConnect extends StatefulWidget {
  const NearbyConnect({Key? key}) : super(key: key);

  @override
  State<NearbyConnect> createState() => _NearbyConnectState();
}

class _NearbyConnectState extends State<NearbyConnect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      appBar: AppBar(
        toolbarHeight: Get.height * 0.12,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: primarybgcolor,
        elevation: 0.0,
        leading: Builder(builder: (context) =>IconButton(
          splashRadius: 1,
          padding: const EdgeInsets.fromLTRB(30, 40, 0, 25),
          onPressed: () {Scaffold.of(context).openDrawer();},
          icon: FaIcon(
            FontAwesomeIcons.bars,
            color: arrowcolor,
          ),
          alignment: Alignment.centerLeft,
        ),),
      ),
      body:Container(
        margin: EdgeInsets.fromLTRB(30, 0, 30, 25),
        child: Column(
          children: [
            Text(
              "Nearby Connections",
              style: TextStyle(
                letterSpacing: 1,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: Get.height*.02),
            SingleChildScrollView(
              child: Container(
                  height: Get.height*0.6,
                  //height: Get.height*0.5,
                  child: ListView.builder(itemCount: 2, itemBuilder: (context,i){return Connect();})
              ),
            ),

          ],
        ),
      )
    );
  }
  Widget Connect(){
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xffEEF7FE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: Get.width * 0.1,
                backgroundColor: primarybgcolor,
                backgroundImage: AssetImage("assets/Avatar.png"),
                //foregroundImage: NetworkImage(sp.imageUrl!),
              ),
            ],
          ),
          Column(
            children: [],
          )
        ],
      )
    );
  }
}
