import 'package:flutter/material.dart';

class Mech_login extends StatefulWidget {
  const Mech_login({super.key});

  @override
  State<Mech_login> createState() => _Mech_loginState();
}

class _Mech_loginState extends State<Mech_login> {
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
              child: ElevatedButton(onPressed: (){},
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
}
