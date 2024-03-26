import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mech_Edit_Profile extends StatefulWidget {
  const Mech_Edit_Profile({super.key});

  @override
  State<Mech_Edit_Profile> createState() => _Mech_Edit_ProfileState();
}

class _Mech_Edit_ProfileState extends State<Mech_Edit_Profile> {
  
  var username_ = TextEditingController();
  var phnnum = TextEditingController();
  var email = TextEditingController();
  var wrkexp = TextEditingController();
  var wrkshop = TextEditingController();
  
  var ID = '';
  
  void initState(){
    getData();
    super.initState();
    
  }
  
  void getData()async{
    final data = await SharedPreferences.getInstance();
    ID = data.getString('id')!;
    
    setState(() {});
  }
  
  updateProfile()async{
    await FirebaseFirestore.instance.collection("mech sign up").doc(ID).update(
        {
         "username": username_.text,
         "email" : email.text,
          "phone num" : phnnum.text,
          "work exp" : wrkexp.text,
          "workshop" : wrkshop.text,
        });
    Navigator.pop(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EDIT PROFILE", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 35,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: CircleAvatar(
                    backgroundImage:AssetImage("assets/image/profile.jpg"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
            //   child: TextFormField(
            //     controller: ,
            //     decoration: InputDecoration(
            //       hintText: "Enter Your Name",
            //       labelText: "Name",
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(15),
            //         borderSide: BorderSide(
            //             style: BorderStyle.solid
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 12,
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
              child: TextFormField(
                controller: username_,
                decoration: InputDecoration(
                  hintText: "Enter Your Username",
                  labelText: "Username",
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
                controller: phnnum,
                decoration: InputDecoration(
                  hintText: "Enter Your Phone Number",
                  labelText: "Phone Number",
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
                controller: email,
                decoration: InputDecoration(
                  hintText: "Enter Your e-mail",
                  labelText: "e-mail",
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
                controller: wrkexp,
                decoration: InputDecoration(
                  hintText: "Enter Your Work Experience",
                  labelText: "Work Experience",
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
                  hintText: "Enter Your Location",
                  labelText: "Location",
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
                controller: wrkshop,
                decoration: InputDecoration(
                  hintText: "Enter Your Shop Name",
                  labelText: "Shop Name",
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
              height: 20,
            ),
            Container(
              height: 50,
              width: 200,
              child: ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                  shape: ContinuousRectangleBorder(
                      side: BorderSide(color: Colors.purple)
                  ),
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  elevation: 30,
                ),
                child: Text("DONE", style: TextStyle(
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
  }
}
