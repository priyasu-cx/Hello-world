import 'package:connecten/provider/connection_provider.dart';
import 'package:connecten/utils/colors.dart';
import 'package:connecten/view/Nav_Drawer/menu.dart';
import 'package:connecten/view/profile_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../provider/sign_in_provider.dart';
import 'package:provider/provider.dart';

class NearbyConnect extends StatefulWidget {
  const NearbyConnect({Key? key}) : super(key: key);

  @override
  State<NearbyConnect> createState() => _NearbyConnectState();
}

class _NearbyConnectState extends State<NearbyConnect> {
  @override
  Widget build(BuildContext context) {
    final cp = context.read<ConnectionProvider>();
    final sp = context.read<SignInProvider>();
    late List<Map<String, String?>> allUserData;
    bool isDone = false;

    Future getallData(List<String> uidList) async {
      List<Map<String, String?>> allUserData = [];

      for (var uid in uidList) {
        var data = await sp.fetchUserDataFirestore(uid.toString());
        print(data["fullname"]);
      }
      return allUserData;
    }


    void getdata() async {
      allUserData = await getallData(cp.connections);
    }

    setState(() {
      getdata();
    });

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
        body: Container(
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
              SizedBox(height: Get.height * .02),
              SingleChildScrollView(
                child: Container(
                    height: Get.height * 0.6,
                    //height: Get.height*0.5,
                    child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, i) {
                          //return Connect(userdata["fullname"], userdata["designation"]);

                          return Connect("Profile name", "Designation");
                        })),
              ),
            ],
          ),
        ));
  }

  Widget Connect(name, designation) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 20),
        height: Get.height * 0.15,
        decoration: BoxDecoration(
          color: Color(0xffEEF7FE),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: CircleAvatar(
                //     radius: Get.width * 0.08,
                //     backgroundColor: primarybgcolor,
                //     backgroundImage: AssetImage("assets/Avatar.png"),
                //     //foregroundImage: NetworkImage(sp.imageUrl!),
                //   ),
                // ),
                // Align(
                //   alignment: Alignment.center,
                //   child: Text(name),
                // )
                Text(
                  name,
                  //textAlign: TextAlign.start,
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
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
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      ProfileDialog(name, context);
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.userPlus,
                      color: arrowcolor,
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
