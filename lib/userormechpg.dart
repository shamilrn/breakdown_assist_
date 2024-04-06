import 'package:breakdown_assist/mechanic/mech_login.dart';
import 'package:breakdown_assist/user/user_login.dart';
import 'package:flutter/material.dart';

import 'admin/admin_login.dart';

class UserOrMech extends StatefulWidget {
  const UserOrMech({super.key});

  @override
  State<UserOrMech> createState() => _UserOrMechState();
}

class _UserOrMechState extends State<UserOrMech> {
  // int selectionvalue = 0;
  // String? CRITERIA;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
    // backgroundColor: Colors.blueGrey,
    body: SingleChildScrollView(
    child: Center(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(
      height: 250,
      width: 300,
      child: Image.asset("assets/image/mechanic.jpg"),
      ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 50,
          width: 200,
          child: ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_login())
            );
          },
            style: ElevatedButton.styleFrom(
              shape: ContinuousRectangleBorder(
                  side: BorderSide(color: Colors.purple)
              ),
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              elevation: 30,
            ),
            child: Text("ADMIN LOGIN", style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
        ),
          SizedBox(
            height: 30,
          ),
        Container(
          height: 50,
          width: 200,
          child: ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Mech_login())
            );
          },
            style: ElevatedButton.styleFrom(
              shape: ContinuousRectangleBorder(
                  side: BorderSide(color: Colors.purple)
              ),
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              elevation: 30,
            ),
            child: Text("MECHANIC LOGIN", style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 50,
          width: 200,
          child: ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>User_logIn())
            );
          },
            style: ElevatedButton.styleFrom(
              shape: ContinuousRectangleBorder(
                  side: BorderSide(color: Colors.purple)
              ),
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              elevation: 30,
            ),
            child: Text("USER LOGIN", style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
        ),
        ],
        ),
    ),
     ),
    );
  }
}
