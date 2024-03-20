import 'package:breakdown_assist/mechanic/tabs/mech_rating_home.dart';
import 'package:breakdown_assist/mechanic/tabs/mech_request_home.dart';
import 'package:breakdown_assist/mechanic/tabs/mech_services_home.dart';
import 'package:flutter/material.dart';

class Mech_Bottombar_Tabs extends StatefulWidget {
  const Mech_Bottombar_Tabs({super.key});

  @override
  State<Mech_Bottombar_Tabs> createState() => _Mech_Bottombar_TabsState();
}

class _Mech_Bottombar_TabsState extends State<Mech_Bottombar_Tabs> {
  int selectedstate_ = 0;
  List tabs_= [
    Request_(),
    Service_(),
    Rating_(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/image/profile.jpg"),
        ),
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.notifications),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            label: "Request",
            icon: Icon(Icons.request_page),),
        BottomNavigationBarItem(
            label: "Service",
            icon: Icon(Icons.home_repair_service),),
        BottomNavigationBarItem(
            label: "Rating",
            icon: Icon(Icons.eighteen_up_rating),),
      ],
      ),
    );
  }
}
