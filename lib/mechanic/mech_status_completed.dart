import 'package:flutter/material.dart';

class Mech_Status_Completed extends StatefulWidget {
  const Mech_Status_Completed({super.key});

  @override
  State<Mech_Status_Completed> createState() => _Mech_Status_CompletedState();
}

class _Mech_Status_CompletedState extends State<Mech_Status_Completed> {
  String? Status;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
          separatorBuilder: (context, index)=> Divider(thickness: 3,color: Colors.white,
          ),
          itemCount: 1,
        itemBuilder: (BuildContext context, int index){
            return Container(
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(10)
              ),
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
          ],
              ),
            );
        },
      ),
      
    );
  }
}
