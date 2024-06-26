import 'package:flutter/material.dart';

import '../mech_notification.dart';
import '../mech_profile.dart';
import 'mech_request_home_acceptpg.dart';
import 'mech_request_home_reqpg.dart';

class Request_ extends StatefulWidget {
  const Request_({super.key});

  @override
  State<Request_> createState() => _Request_State();
}

class _Request_State extends State<Request_> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          leading: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Mech_Profile())
              );
            },
            child: CircleAvatar(
              radius: 10,
              backgroundImage: AssetImage("assets/image/profile.jpg"),
            ),
          ),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>Mech_Notification() ),
              );
            }, icon:Icon(Icons.notifications, color: Colors.white,),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TabBar(
              tabs: [
              Tab(
                child: Text("Requests"),
              ),
            Tab(
              child: Text("Accepted"),
            )
            ],
            ),
            Expanded(child: TabBarView(children: [
              Mech_ReqPg(),
              Mech_AcceptPg(),

            ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}
