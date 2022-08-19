import 'package:connecten/utils/colors.dart';
import 'package:connecten/view/Nav_Drawer/menu.dart';
import 'package:connecten/view/profile_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Connections extends StatefulWidget {
  const Connections({Key? key}) : super(key: key);

  @override
  State<Connections> createState() => _ConnectionsState();
}

class _ConnectionsState extends State<Connections> {
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
                "Connections",
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
                    child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context,i){return ConnectBox("Profile name","Designation");})
                ),
              ),

            ],
          ),
        )
    );
  }
  Widget ConnectBox(name,designation){
    return InkWell(
      onTap: (){ProfileDialog(name, context);},
      child: Container(
          alignment: Alignment.centerLeft,
          height: Get.height*0.1,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Color(0xffEEF7FE),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                //textAlign: TextAlign.start,
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: Get.height*0.01,),
              Text(
                designation,
                //textAlign: TextAlign.start,
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          )
      ),
    );
  }
}
