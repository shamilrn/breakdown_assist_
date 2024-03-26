import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mech_bottom_bar_tabs.dart';

class Mech_login extends StatefulWidget {
  const Mech_login({super.key});

  @override
  State<Mech_login> createState() => _Mech_loginState();
}

class _Mech_loginState extends State<Mech_login> {
  final _key = GlobalKey<FormState>();

  var username =  TextEditingController();
  var password = TextEditingController();

String mail = '';
String phnnum = '';
String username_ = '';
String workexp = '';
String workshop = '';
String id = '';


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
            Text("LOGIN", style: TextStyle(
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
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextFormField(
                controller: password,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){},
                    child: Text("Forgot Your Password?", style: TextStyle(fontSize: 13),)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 200,
              child: ElevatedButton(onPressed: (){
                mechLogIn();
              },
                style: ElevatedButton.styleFrom(
                  shape: ContinuousRectangleBorder(
                      side: BorderSide(color: Colors.purple)
                  ),
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  elevation: 30,
                ),
                child: Text("LOGIN", style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("don't have an account?", style: TextStyle(fontSize: 13),),
                TextButton(onPressed: (){},
                    child: Text("Sign Up", style: TextStyle(fontSize: 13),)),
              ],
            )
          ],
        ),
      ),
    );
  }
  void mechLogIn() async{
    print('object');
    final mech = await FirebaseFirestore.instance
        .collection('mech sign in')
        .where('email',isEqualTo:  username.text )
        .where('password', isEqualTo: password.text)
        .where('status', isEqualTo: 1)
        .get();
    print('object1');
    if(mech.docs.isNotEmpty){
      id = mech.docs[0].id;
      mail = mech.docs[0]['email'];
      phnnum = mech.docs[0]['phone num'];
      username_ = mech.docs[0]['username'];
      workexp = mech.docs[0]['work exp'];
      workshop = mech.docs[0]['workshop'];
      print('object2');
      SharedPreferences data = await SharedPreferences.getInstance();
      print("object3");
      data.setString('id', id);
      data.setString('username', username_);
      data.setString('email', mail);
      data.setString('phonenum', phnnum);
      data.setString('workexp', workexp);
      data.setString('workshop', workshop);


      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Mech_Bottombar_Tabs()
      ),
      );
      
    }
  }

}
