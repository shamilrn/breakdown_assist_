import 'package:flutter/material.dart';

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
        body: Column(
          children: [
            TabBar(tabs: [
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
