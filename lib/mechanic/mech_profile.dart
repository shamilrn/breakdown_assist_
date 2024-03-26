import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mech_edit_profile.dart';

class Mech_Profile extends StatefulWidget {
  const Mech_Profile({super.key});

  @override
  State<Mech_Profile> createState() => _Mech_ProfileState();
}

class _Mech_ProfileState extends State<Mech_Profile> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  var ID = '';


  // String name = '';
  // String phnnum = '';
  // String email = '';
  // String wrkexp = '';
  // String wrkshop = '';
  // String location = '';

 Future<void> getData() async {
   SharedPreferences pref = await SharedPreferences.getInstance();
   setState(() {
     ID = pref.getString('id')!;
     print('object');
   });
    // name = data.getString('username')!;
    // phnnum = data.getString('phone num')!;
    // email = data.getString('email')!;
    // wrkexp = data.getString('work exp')!;
    // wrkshop = data.getString('workshop')!;
  }
  DocumentSnapshot? mech;
 GetUpdateData() async{
   mech = await FirebaseFirestore.instance.collection('mech sign in').doc(ID).get();
   print('object2');
 }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetUpdateData(),
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

        return Scaffold(
          appBar: AppBar(
            title: Text(
              "PROFILE",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.purple,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Mech_Edit_Profile()));
                  },
                  icon: Icon(Icons.edit_outlined)),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/image/profile.jpg"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: mech?["username"],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(style: BorderStyle.solid),
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
                      hintText: mech?["phone num"],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(style: BorderStyle.solid),
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
                      hintText: mech?["email"],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(style: BorderStyle.solid),
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
                      hintText: mech?["work exp"],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(style: BorderStyle.solid),
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
                      hintText: mech?["workshop"],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(style: BorderStyle.solid),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //       hintText: "Enter Your Workshop Name",
                //       labelText: "Workshop Name",
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(15),
                //         borderSide: BorderSide(style: BorderStyle.solid),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Your Location",
                      labelText: "Location",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(style: BorderStyle.solid),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: ContinuousRectangleBorder(
                          side: BorderSide(color: Colors.purple)),
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      elevation: 30,
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
