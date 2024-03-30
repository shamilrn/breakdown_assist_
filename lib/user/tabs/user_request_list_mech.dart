import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User_Req_List extends StatefulWidget {
  const User_Req_List({super.key});

  @override
  State<User_Req_List> createState() => _User_Req_ListState();
}

class _User_Req_ListState extends State<User_Req_List> {

  void initState() {
    super.initState();
    GetMechDetails();
  }

  var ID = '';

  Future<void>GetMechDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();




    ID = prefs.getString('id')!;
    setState(() {

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('mechreq').where('userid', isEqualTo: ID).get(),
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
          final mech = snapshot.data?.docs ?? [];

          return ListView.separated(
            separatorBuilder: (context, index)=> Divider(thickness: 3,color: Colors.white,
            ),
            itemCount: mech.length,
            itemBuilder: (BuildContext context, int index){
              return Container(
                height: 100,
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(mech[index]['mechname'],style: TextStyle(fontSize: 13,),),
                        Text(mech[index]['date'],style: TextStyle(fontSize: 13)),
                        Text(mech[index]['time'],style: TextStyle(fontSize: 13)),
                        Text(mech[index]['service'],style: TextStyle(fontSize: 13)),
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Container(
                          height: 25,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15),

                          ),
                          child: Center(child: Text("Available", style: TextStyle(color: Colors.white),)),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              );
            },

          );
        },
      ),
    );
  }
}
