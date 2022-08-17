import 'package:connecten/utils/colors.dart';
import 'package:connecten/view/Nav_Drawer/drawer_item.dart';
import 'package:connecten/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: secbgcolor,
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, Get.height*0.12, Get.width*0.05, 0),
          child: Column(
            children: [
              headerWidget(),
              SizedBox(height: Get.height*0.05,),
              const Divider(thickness: 1, height: 10, color: Colors.grey,),
              SizedBox(height: Get.height*0.05,),
              DrawerItem(
                name: 'Nearby Connects',
                icon: Icons.people_rounded,
                onPressed: ()=> onItemPressed(context, index: 0),
              ),
              SizedBox(height: Get.height*0.03,),
              DrawerItem(
                name: 'Connections',
                icon: Icons.people,
                onPressed: ()=> onItemPressed(context, index: 0),
              ),
              SizedBox(height: Get.height*0.03,),
              DrawerItem(
                  name: 'Profile',
                  icon: Icons.manage_accounts,
                  onPressed: ()=> onItemPressed(context, index: 2)
              ),
              SizedBox(height: Get.height*0.03,),
              const Divider(thickness: 1, height: 10, color: Colors.grey,),
              SizedBox(height: Get.height*0.03,),
              DrawerItem(
                  name: 'Setting',
                  icon: Icons.settings,
                  onPressed: ()=> onItemPressed(context, index: 4)
              ),
              SizedBox(height: Get.height*0.03,),
              DrawerItem(
                  name: 'Log out',
                  icon: Icons.logout,
                  onPressed: ()=> onItemPressed(context, index: 5)
              ),

            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}){
    Navigator.pop(context);

    switch(index){
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()));
        break;
    }
  }

  Widget headerWidget() {
    const url = 'https://icon-library.com/images/avatar-icon-images/avatar-icon-images-4.jpg';
    return Row(
      children: [
        CircleAvatar(
          radius: Get.height*0.055,
          backgroundImage: NetworkImage(url),
        ),
        SizedBox(width: Get.height*0.03,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Person name', style: TextStyle(fontSize: 14, color: Colors.black)),
            SizedBox(height: 10,),
            Text('person@email.com', style: TextStyle(fontSize: 14, color: Colors.black))
          ],
        )
      ],
    );

  }
}
class People extends StatelessWidget {
  const People({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
    );
  }
}