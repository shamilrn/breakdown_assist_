import 'package:flutter/material.dart';

class UserOrMech extends StatefulWidget {
  const UserOrMech({super.key});

  @override
  State<UserOrMech> createState() => _UserOrMechState();
}

class _UserOrMechState extends State<UserOrMech> {
  int selectionvalue = 0;
  String? CRITERIA;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
    // backgroundColor: Colors.blueGrey,
    body: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Container(
    height: 250,
    width: 300,
    child: Image.asset("assets/image/mechanic.jpg"),
    ),
      SizedBox(
        height: 12,
      ),
      Text("SELECT YOUR CRITERIA:", style: TextStyle(fontSize: 17,
          fontWeight: FontWeight.bold),
      ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 250,
              child: DropdownButton(
                value: selectionvalue,
                  items: [
                    DropdownMenuItem(child: Text("-select-", style: TextStyle(color: Colors.black),),
                    value: 0,
                    ),
                    DropdownMenuItem(child: Text("USER LOGIN" , style: TextStyle(color: Colors.black),),
                      value: 1,
                    ),
                    DropdownMenuItem(child: Text("MECHANIC LOGIN" , style: TextStyle(color: Colors.black),),
                      value: 2,
                    ),
                  ],
                  onChanged: (int? value){
                setState(() {
                  selectionvalue = value!;
                });
              }
              ),
            ),
          ],
        ),
      SizedBox(
        height: 30,
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
      ],
      ),
     ),
    );
  }
}
