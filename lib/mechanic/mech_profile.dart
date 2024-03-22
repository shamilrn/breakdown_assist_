import 'package:flutter/material.dart';

class Mech_Profile extends StatefulWidget {
  const Mech_Profile({super.key});

  @override
  State<Mech_Profile> createState() => _Mech_ProfileState();
}

class _Mech_ProfileState extends State<Mech_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter Your Name",
                  labelText: "Name",
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
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
              child: TextFormField(
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
              height: 50,
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
                child: Text("Submit", style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
