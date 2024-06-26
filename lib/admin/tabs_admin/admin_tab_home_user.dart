import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../admin_user.dart';

class Admin_user_home_tab extends StatefulWidget {
  const Admin_user_home_tab({super.key});
 

  @override
  State<Admin_user_home_tab> createState() => _Admin_user_home_tabState();
}

class _Admin_user_home_tabState extends State<Admin_user_home_tab> {
  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10
        ),
        child: FutureBuilder(
          future: FirebaseFirestore.instance.collection('user sign in').get(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
        return ListView.separated(
          separatorBuilder: (context, index) =>
              Divider(thickness: 0, color: Colors.white,),
          itemCount: user.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_User(id: user[index].id,))
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                  ),
                  height: 100,
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/image/profile.jpg"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user[index]['username'], style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),),
                          Text(user[index]['location'], style: TextStyle(fontSize: 12)),
                          Text(user[index]['phone number'], style: TextStyle(fontSize: 12)),
                          Text(user[index]['mail id'], style: TextStyle(fontSize: 12)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
          }
        ),
      ),
    );
  }
}
