import 'package:flutter/material.dart';

class Mech_ReqPg extends StatefulWidget {
  const Mech_ReqPg({super.key});

  @override
  State<Mech_ReqPg> createState() => _Mech_ReqPgState();
}

class _Mech_ReqPgState extends State<Mech_ReqPg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          separatorBuilder: (context, index)=> Divider(thickness: 5, color: Colors.white,
          ),
          itemCount: 3,
        itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
              child: Container(
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

                        Text("Fuel leaking",style: TextStyle(fontSize: 13)),
                        Text("Date",style: TextStyle(fontSize: 13)),
                        Text("Time",style: TextStyle(fontSize: 13)),
                        Text("Place",style: TextStyle(fontSize: 13)),
                      ],
                    ),
                    SizedBox(width: 15,),
                  ],
                ),
              ),
            );
        },
      ),
    );
  }
}
