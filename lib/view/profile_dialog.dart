
import 'package:connecten/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProfileDialog extends StatefulWidget {
  const ProfileDialog({Key? key}) : super(key: key);

  @override
  State<ProfileDialog> createState() => _ProfileDialogState();
}

class _ProfileDialogState extends State<ProfileDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(20.0)),
      child: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlutterLogo(size: 150,),
            Text("This is a Custom Dialog",style:TextStyle(fontSize: 20),),
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text("Close"))
          ],
        ),
      ),
    ) ;
  }
}





