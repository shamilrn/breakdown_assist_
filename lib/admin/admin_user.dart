import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Admin_User extends StatefulWidget {
  const Admin_User({super.key,required this.id});
  final id;

  @override
  State<Admin_User> createState() => _Admin_UserState();
}

class _Admin_UserState extends State<Admin_User> {

  late DocumentSnapshot user;

  getData() async{
    user = await FirebaseFirestore.instance.collection('user sign in').doc(widget.id).get();
  }

  void accept(id){
    setState(() {
      FirebaseFirestore.instance.collection('user sign in').doc(id).update(
          {'status':1});
    });
  }

  void reject(id){
    setState(() {
      FirebaseFirestore.instance.collection('user sign in').doc(id).update({
        'status':2
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getData() ,
          builder: (context, snapshot) {
            if (snapshot.connectionState==ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError){
              return Text("Error${snapshot.error}");
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(user['path']),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(user['username'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Location", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: user['username'],
                     //   labelText: "Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              style: BorderStyle.solid
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: user['phone number'],
                        //labelText: "Phone Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              style: BorderStyle.solid
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: user['mail id'],
                       // labelText: "e-mail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              style: BorderStyle.solid
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  user['status']==0?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: (){
                        accept(widget.id);
                      },
                        style: ElevatedButton.styleFrom(
                          shape: ContinuousRectangleBorder(
                              side: BorderSide(color: Colors.purple)
                          ),
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white,
                          elevation: 15,
                        ),
                        child: Text("ACCEPT", style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(onPressed: (){
                        reject(widget.id);
                      },
                        style: ElevatedButton.styleFrom(
                          shape: ContinuousRectangleBorder(
                              side: BorderSide(color: Colors.red)
                          ),
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          elevation: 15,
                        ),
                        child: Text("REJECT", style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                    ],
                  ):
                      user['status']==1?
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                        ),
                        child: Center(child: Text("ACCEPTED",
                          style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),)),
                      )
                          : Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                        child: Center(child: Text("REJECTED",
                          style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),)),
                      )                ],
              ),
            );
          },

        ),
      ),
    );
  }
}
