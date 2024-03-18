import 'package:flutter/material.dart';

class Admin_User extends StatefulWidget {
  const Admin_User({super.key});

  @override
  State<Admin_User> createState() => _Admin_UserState();
}

class _Admin_UserState extends State<Admin_User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
                  backgroundImage: AssetImage("assets/image/profile.jpg"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
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
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){},
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
                  ElevatedButton(onPressed: (){},
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
