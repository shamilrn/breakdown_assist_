import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'mech_login.dart';

class Mech_signUp extends StatefulWidget {
  const Mech_signUp({super.key});

  @override
  State<Mech_signUp> createState() => _Mech_signUpState();
}

class _Mech_signUpState extends State<Mech_signUp> {
  var username = TextEditingController();
  var phnnum = TextEditingController();
  var email = TextEditingController();
  var wrkexp = TextEditingController();
  var wrkshop = TextEditingController();
  var passwrd = TextEditingController();

  Future<dynamic> mechsignin()async{
    await FirebaseFirestore.instance.collection('mech sign in').add({
      "username": username.text,
      "phone num": phnnum.text,
      "email": email.text,
      "work exp": wrkexp.text,
      "workshop": wrkshop.text,
      "status": 0,
      "password": passwrd.text,
    }).then((value){
      print("complete");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Mech_login())
      );
      print("Sign in Success");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: 300,
              child: Image.asset("assets/image/mechanic.jpg"),
            ),
            Text("SIGN UP", style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold
            ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextFormField(
                controller: username,
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
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
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
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
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
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
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
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextFormField(
                controller: wrkshop,
                decoration: InputDecoration(
                  hintText: "Enter Your Workshop Name",
                  labelText: "Workshop Name",
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
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextFormField(
                controller: passwrd,
                decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  labelText: "Password",
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
              height: 30,
            ),
            Container(
              height: 50,
              width: 200,
              child: ElevatedButton(onPressed: (){
                mechsignin();
              },
                style: ElevatedButton.styleFrom(
                  shape: ContinuousRectangleBorder(
                    side: BorderSide(color: Colors.purple)
                  ),
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  elevation: 30,
                ),
                child: Text("SIGN UP", style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
