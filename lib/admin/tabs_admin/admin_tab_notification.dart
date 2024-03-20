// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notification_ extends StatefulWidget {
  const Notification_({super.key});

  @override
  State<Notification_> createState() => _Notification_State();
}

class _Notification_State extends State<Notification_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){},
      child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: 330,
          child: ListView.separated(separatorBuilder: (context,index)=> Divider(thickness: 5,color: Colors.white,),
              itemCount: 10,
            itemBuilder: (BuildContext context, int index){
            return Container(
              height: 100,
              width: 150,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text("Heading", style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text("Matter...blah...blah"),
                    ],
                  ),
                ],
              ),
            );
            },
          ),
        ),
      ),
    );
  }
}
