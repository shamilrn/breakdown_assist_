import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../user_mech_details.dart';

class User_Mech_list extends StatefulWidget {
  const User_Mech_list({super.key});

  @override
  State<User_Mech_list> createState() => _User_Mech_listState();
}

class _User_Mech_listState extends State<User_Mech_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('mech sign in').where('status', isEqualTo: 1).get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
final mechlist = snapshot.data?.docs ??[];
          return  ListView.separated(
            separatorBuilder: (context, index)=> Divider(thickness: 3,color: Colors.white,
            ),
            itemCount: mechlist.length,
            itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>User_Mech_Details_Page(id: mechlist[index].id,))
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                    ),
                    height: 130,
                    width: 200,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              SizedBox(height: 15,),
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage("assets/image/profile.jpg"),
                              ),
                              Text(mechlist[index]["username"],style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Spacer(),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(mechlist[index]["work exp"],style: TextStyle(fontSize: 13)),
                              Text("Fuel leaking",style: TextStyle(fontSize: 13)),
                              Container(
                                height: 25,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: CupertinoColors.activeGreen,
                                ),
                                child: Center(child: Text("Available")),
                              ),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },

          );
        },
      ),
    );
  }
}
