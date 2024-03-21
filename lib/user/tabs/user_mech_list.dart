import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User_Mech_list extends StatefulWidget {
  const User_Mech_list({super.key});

  @override
  State<User_Mech_list> createState() => _User_Mech_listState();
}

class _User_Mech_listState extends State<User_Mech_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          separatorBuilder: (context, index)=> Divider(thickness: 3,color: Colors.white,
          ),
          itemCount: 2,
        itemBuilder: (BuildContext context, int index){
            return Container(
              height: 100,
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/image/profile.jpg"),
                      ),
                      Text("Name",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("2+ Years Experience",style: TextStyle(fontSize: 13)),
                      Text("Fuel leaking",style: TextStyle(fontSize: 13)),
                      Container(
                        height: 25,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: CupertinoColors.activeGreen,
                        ),
                        child: Center(child: Text("Available")),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            );
        },

      ),
    );
  }
}
