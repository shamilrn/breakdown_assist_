import 'package:flutter/material.dart';

class Admin_home_user extends StatefulWidget {
  const Admin_home_user({super.key});

  @override
  State<Admin_home_user> createState() => _Admin_home_userState();
}

class _Admin_home_userState extends State<Admin_home_user> {
   int selectedstate = 0;
   List<Widget> _adminhomeuserwidgetoptions = <Widget>[
     Text("HOME"),
     Text("data")
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BottomNavigationBar(items: items),
      ),
    );
  }
}
