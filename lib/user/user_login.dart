

import 'package:breakdown_assist/user/tabs/user_mech_tabbar.dart';
import 'package:breakdown_assist/user/user_mech_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User_logIn extends StatefulWidget {
  const User_logIn({super.key});

  @override
  State<User_logIn> createState() => _User_logInState();
}

class _User_logInState extends State<User_logIn> {
  final _key = GlobalKey<FormState>();

  var username = TextEditingController();
  var password = TextEditingController();

  String mail_id= '';
 // String password_ = '';
  String phone_number ='';
  String username_ = '';
  String id ='';
  //String status= '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Form(
           key: _key,
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
                  validator: (value){
                    if(value== null || value.isEmpty){
                      return 'Please enter your username';
                    }
                    return null;
                  },
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
                  validator: (value){
                    if(value== null || value.isEmpty){
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  obscureText: true,
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
                  userLogIn();
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
      ),
    );
  }
  void userLogIn() async {
    print("3333");
    final user = await FirebaseFirestore.instance
        .collection('user sign in')
        .where('mail id', isEqualTo: username.text)
        .where('password', isEqualTo: password.text)
        //.where('status', isEqualTo: 1)
        .get();
    print("object");
    if(user.docs.isNotEmpty){
      id = user.docs[0].id;
      mail_id = user.docs[0]['mail id'];
      //password_ = user.docs[0]['password'];
      phone_number = user.docs[0]['phone number'];
      username_ = user.docs[0]['username'];
      //status = user.docs[0]['status'];

print("object");
      SharedPreferences data = await SharedPreferences.getInstance();
      data.setString('id', id);
      data.setString('mail id', mail_id);
     // data.setString('password', password_);
      data.setString('phone number', phone_number);
      data.setString('username', username_);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>User_Mech_tabbar()
      )
      );

    }

}
}