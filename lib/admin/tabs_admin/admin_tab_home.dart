import 'package:flutter/material.dart';

import 'admin_tab_home_mechanic.dart';
import 'admin_tab_home_user.dart';

class Home_ extends StatefulWidget {
  const Home_({super.key});

  @override
  State<Home_> createState() => _Home_State();
}

class _Home_State extends State<Home_> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: Column(
          children: [

            TabBar(
                tabs: [Tab(child: Text("User"),
            ),
              Tab(child:Text("Mechanic") ,)
            ]),
            Expanded(
              child: TabBarView(children: [
                Admin_user_home_tab(),
                Admin_mechanic_tab_home(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
