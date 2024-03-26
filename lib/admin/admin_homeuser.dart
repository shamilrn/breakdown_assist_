import 'package:breakdown_assist/admin/tabs_admin/admin_tab_home.dart';
import 'package:breakdown_assist/admin/tabs_admin/admin_tab_notification.dart';
import 'package:breakdown_assist/admin/tabs_admin/admin_tab_payment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Admin_home_user extends StatefulWidget {
  const Admin_home_user({super.key});

  @override
  State<Admin_home_user> createState() => _Admin_home_userState();
}

class _Admin_home_userState extends State<Admin_home_user> {
   int selectedstate = 0;
   List tabs = [
     Home_(),
     Payment_(),
     Notification_(),

   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/image/profile.jpg"),
        ),
      ),
       bottomNavigationBar:  BottomNavigationBar(items: [
        BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Payment",
          icon: Icon(Icons.payment),
        ),
        BottomNavigationBarItem(
          label: "Notification",
          icon: Icon(Icons.notifications),
        ),
      ],
        iconSize: 30,
        currentIndex: selectedstate,
        onTap: (int index){
        setState(() {
          selectedstate= index;
        });
        },
      ),
      body: tabs.elementAt(selectedstate),
    );
  }
}
