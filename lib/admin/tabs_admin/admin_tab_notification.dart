// import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../admin_add_notification.dart';

class Notification_ extends StatefulWidget {
  const Notification_({super.key});

  @override
  State<Notification_> createState() => _Notification_State();
}

class _Notification_State extends State<Notification_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_Add_Notification())
        );
      },
      child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
            ),
            height:100,
            width: 360,
            child: FutureBuilder(
              future: FirebaseFirestore.instance.collection('notofications').get(),
              builder: (context, AsyncSnapshot<QuerySnapshot>snapshot){
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error:${snapshot.error}"),
                  );
                }
                final user = snapshot.data?.docs ?? [];
                return ListView.separated(separatorBuilder: (context,index)=> Divider(thickness: 5,color: Colors.white,),
                  itemCount: user.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      height: 130,
                      width: 100,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Text(user[index]["matter"], style: TextStyle(fontWeight: FontWeight.bold),),
                              Spacer(),
                              Text(user[index]['date']),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Text(user[index]["content"]),
                              Spacer(),
                              Text(user[index]['time']),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
