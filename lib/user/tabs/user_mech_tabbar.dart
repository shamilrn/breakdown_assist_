import 'package:breakdown_assist/user/tabs/user_mech_list.dart';
import 'package:breakdown_assist/user/tabs/user_request_list_mech.dart';
import 'package:flutter/material.dart';

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
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/image/profile.jpg"),

          ),
          actions: [
            IconButton(onPressed: (){}, icon:Icon(Icons.notifications),
            ),
          ],
        ),
        bottomSheet:
            Container(
              decoration: BoxDecoration(
                color: Colors.purple.shade50
              ),
              child: Card(
                color: Colors.purple.shade50,
                child: TabBar(tabs: [
                  Tab(
                    child: Text("Requests"),
                  ),
                  Tab(
                    child: Text("Accepted"),
                  )
                ],
                ),
              ),
            ),
            body: Expanded(child: TabBarView(children: [
              User_Mech_list(),
              User_Req_List(),

            ],
            ),
            ),


      ),
    );
  }
}
