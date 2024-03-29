import 'package:breakdown_assist/user/tabs/user_mech_list.dart';
import 'package:breakdown_assist/user/tabs/user_request_list_mech.dart';
import 'package:flutter/material.dart';

import '../user_profile.dart';

class User_Mech_tabbar extends StatefulWidget {
  const User_Mech_tabbar({super.key});

  @override
  State<User_Mech_tabbar> createState() => _User_Mech_tabbarState();
}

class _User_Mech_tabbarState extends State<User_Mech_tabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: Container(
            width: 200,
            height: 50,
            child: Center(
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search...",
                  suffixIcon: Icon(Icons.search, color: Colors.black,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        style: BorderStyle.solid
                    ),
                  ),
                ),
              ),
            ),
          ),
          leading: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>User_Profile())
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/image/profile.jpg"),

              ),
            ),
          ),
          actions: [
            IconButton(onPressed: (){}, icon:Icon(Icons.notifications, color: Colors.white,),
            ),
          ],
        ),
        bottomSheet:
            Container(
              decoration: BoxDecoration(
                color: Colors.purple.shade50
              ),
              child: Card(
                color: Colors.purple,
                child: TabBar(tabs: [
                  Tab(
                    child: Text("Requests", style: TextStyle(color: Colors.white),),
                  ),
                  Tab(
                    child: Text("Accepted", style: TextStyle(color: Colors.white),),
                  )
                ],
                ),
              ),
            ),
            body: TabBarView(children: [
            User_Mech_list(),
            User_Req_List(),

                        ],
                        ),


      ),
    );
  }
}
