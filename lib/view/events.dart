import 'package:connecten/utils/colors.dart';
import 'package:connecten/view/Nav_Drawer/menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpEvents extends StatefulWidget {
  const UpEvents({Key? key}) : super(key: key);

  @override
  State<UpEvents> createState() => _UpEventsState();
}

class _UpEventsState extends State<UpEvents> {
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
                "Upcoming Events",
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: Get.height * .02),
              SingleChildScrollView(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("events")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    } else if (snapshot.hasData || snapshot.data != null) {
                      return ListView.builder(
                        reverse: true,
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            Event_card(index, snapshot),
                        itemCount: snapshot.data?.docs.length,
                      );
                    } else {
                      return Text('Something went wrong');
                    }
                  },
                )
              ),
            ],
          ),
        )
    );
  }

  Widget Event_card(index, snapshot) {
    QueryDocumentSnapshot<Object?>? documentSnapshot =
    snapshot.data?.docs[index];
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: (){
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              context: context,
              elevation: 1,
              builder: (BuildContext context){return Event_details(index,snapshot);}
          );
        },
      child: Container(
        //height: Get.height*0.1,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
          decoration: BoxDecoration(
            color: cardcolor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                        (documentSnapshot != null) ? (documentSnapshot["Name"]) : "",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.justify,
                      ),
                        Text(
                          (documentSnapshot != null) ? (documentSnapshot["Location"]) : "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: Get.height*0.01,),
                        Text(
                          (documentSnapshot != null) ? (documentSnapshot["Date"]) : "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        IconButton(onPressed: (){},
                            icon: Icon(Icons.event_seat_rounded)
                        )
                      ],
                    )
                  ],
                )


              ],
            )
          )),)
    );

  }

  Widget Event_details(index,snapshot){
    QueryDocumentSnapshot<Object?>? documentSnapshot =
    snapshot.data?.docs[index];
    return Container(
      // decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topRight,
      //       end: Alignment.bottomLeft,
      //       colors: [
      //         Colors.blue,
      //         Colors.red,
      //       ],
      //     )
      // ),
      margin: EdgeInsets.fromLTRB(30, 30, 30, 25),
      //padding: ,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (documentSnapshot != null) ? (documentSnapshot["Name"]) : "",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Get.height*0.01,),
          Text(
            (documentSnapshot != null) ? (documentSnapshot["Location"]) : "",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w300),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: Get.height*0.01,),
          Text(
            (documentSnapshot != null) ? (documentSnapshot["Date"]) : "",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w300),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: Get.height*0.01,),


          Text(
            (documentSnapshot != null) ? (documentSnapshot["About"]) : "",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w300),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: Get.height*0.02,),
          const Divider(
            thickness: 1,
            height: 10,
            color: Colors.grey,
          ),
          SizedBox(height: Get.height*0.02,),
          Text(
            "{ Attendees }",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.justify,
          ),SizedBox(height: Get.height*0.02,),
          const Divider(
            thickness: 1,
            height: 10,
            color: Colors.grey,
          ),SizedBox(height: Get.height*0.02,),
          SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return ListTile(
                  
                  dense: true,
                  selectedTileColor: Colors.blue,
                  title: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border(),
                    ),
                    child: Text("Attendee Name"),
                  ),
                );
              },
            )
          )

        ]

      ),
    );
  }
}
