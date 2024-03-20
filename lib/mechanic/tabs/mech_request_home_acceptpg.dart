import 'package:flutter/material.dart';

class Mech_AcceptPg extends StatefulWidget {
  const Mech_AcceptPg({super.key});

  @override
  State<Mech_AcceptPg> createState() => _Mech_AcceptPgState();
}

class _Mech_AcceptPgState extends State<Mech_AcceptPg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          separatorBuilder: (context, index)=> Divider(thickness: 5, color: Colors.white,
          ),
          itemCount: 3,
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

                      Text("Fuel leaking",style: TextStyle(fontSize: 13)),
                      Text("Date",style: TextStyle(fontSize: 13)),
                      Text("Time",style: TextStyle(fontSize: 13)),
                      Text("Place",style: TextStyle(fontSize: 13)),
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 30,
                    width: 130,
                    decoration: BoxDecoration(
                        color: Colors.green,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)
                    ),

                    child: Center(child: Text("Payment Success")),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            );
        },
      ),
    );
  }
}
