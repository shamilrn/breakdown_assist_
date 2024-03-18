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
      body: Container(
        height: 200,
        width: 330,
        child: ListView.separated(separatorBuilder: (context,index)=> Divider(thickness: 5,color: Colors.white,),
            itemCount: 10,
          itemBuilder: (BuildContext context, int index){
          return Container(
            height: 100,
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text("Name", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                Spacer(),
                Text("11/04/2024", style: TextStyle(fontSize: 12),)
              ],
            ),
          );
          },
        ),
      ),
    );
  }
}
