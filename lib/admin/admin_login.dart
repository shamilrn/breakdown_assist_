import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'admin_homeuser.dart';

class Admin_login extends StatefulWidget {
  const Admin_login({super.key});

  @override
  State<Admin_login> createState() => _Admin_loginState();
}

class _Admin_loginState extends State<Admin_login> {
  final _key = GlobalKey<FormState>();
  var name = TextEditingController();
  var password= TextEditingController();
  login(){
    if(name.text == 'admin@gmail.com' && password.text == '123'){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Admin_home_user()),
      );
    }
  }
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

                  validator: (value){
                    if(value == null || value.isEmpty){
                      return '*This field is required';
                    }
                    return null;
                  },

                  controller: name,
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

                  validator: (value){
                    if(value == null || value.isEmpty){
                      return '*This field is required';
                    }
                    return null;
                  },

                  controller: password,
                  obscureText: true,
                  keyboardType: TextInputType.number,
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
                height: 20,
              ),
              Container(
                height: 50,
                width: 200,
                child: ElevatedButton(onPressed: (){
                  login();
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
            ],
          ),
        ),
      ),
    );
  }
}
