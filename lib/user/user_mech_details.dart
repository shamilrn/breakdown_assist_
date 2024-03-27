import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User_Mech_Details_Page extends StatefulWidget {
  const User_Mech_Details_Page({super.key,required this.id});
  final id;

  @override
  State<User_Mech_Details_Page> createState() => _User_Mech_Details_PageState();
}

class _User_Mech_Details_PageState extends State<User_Mech_Details_Page> {
  int select = 0;

  late DocumentSnapshot mechlist;

  getmechlistdata() async{
    mechlist = await FirebaseFirestore.instance.collection('mech sign in').doc(widget.id).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Needed Service", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder(
            future: getmechlistdata(),
            builder: (context, snapshot) {
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

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/image/profile.jpg"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(mechlist["username"],style: TextStyle(fontSize: 25),),
                  SizedBox(
                    height: 10,
                  ),
                  Text(mechlist["phone num"],style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 5,
                  ),
                  Text(mechlist["work exp"],style: TextStyle(fontSize: 20),),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white),
                      color: Colors.green.shade400,
                    ),
                    child: Text("Available",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 130, 0),
                    child: Text("Add Needed Service",style: TextStyle(fontSize: 20)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.purple.shade50,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: DropdownButton(
                              isExpanded: true,
                              icon: Icon(Icons.keyboard_arrow_down_outlined),
                              iconSize: 35,
                              style: TextStyle(fontSize: 20,color: Colors.black),
                              value: select,
                              items:[
                                DropdownMenuItem(child: Text("-service-"),
                                  value: 0,
                                ),
                                DropdownMenuItem(child: Text("Puncture"),
                                  value: 1,
                                ),
                                DropdownMenuItem(child: Text("Fuel Leaking"),
                                  value: 2,
                                ),
                              ] ,
                              onChanged: (value){
                                setState(() {
                                  select = value!;
                                }
                                );
                              }
                          ),
                        ),
                      ),

                      IconButton(onPressed: (){},
                          icon: Icon(
                              size: 35,
                              Icons.add_circle_rounded))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 250, 0),
                    child: Text("Place",style: TextStyle(fontSize: 20),),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: TextFormField(
                        style: TextStyle(fontSize: 20),
                        maxLines: 5,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Place"
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(180, 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white
                      ),
                      onPressed: (){},
                      child: Text("Request",style: TextStyle(fontSize: 20),))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}