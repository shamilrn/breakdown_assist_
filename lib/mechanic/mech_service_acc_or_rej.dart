import 'package:flutter/material.dart';

class Ser_Acce_or_Reject extends StatefulWidget {
  const Ser_Acce_or_Reject({super.key});

  @override
  State<Ser_Acce_or_Reject> createState() => _Ser_Acce_or_RejectState();
}

class _Ser_Acce_or_RejectState extends State<Ser_Acce_or_Reject> {
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
              Container(
                width: 330,
                height: MediaQuery.of(context).size.width,
                child: Row(
                  children: [

                    Column(
                      children: [
                        Text("Problem", style: TextStyle(
                          fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold,
                        ),
                        ),
                        SizedBox(height:  10,),
                        Text("Place", style: TextStyle(
                          fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold,
                        ),
                        ),
                        SizedBox(height:  10,),
                        Text("Date", style: TextStyle(
                          fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold,
                        ),
                        ),
                        SizedBox(height:  10,),
                        Text("Time", style: TextStyle(
                          fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold,
                        ),
                        ),
                        SizedBox(height:  10,),
                        Text("Contact Number", style: TextStyle(
                          fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold,
                        ),
                        ),
                        SizedBox(),
                      ],
                    ),
                Spacer(),

                Column(
                  children: [
                    Text(":", style: TextStyle(
                      fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(height:  10,),
                    Text(":", style: TextStyle(
                      fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(height:  10,),
                    Text(":", style: TextStyle(
                      fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(height:  10,),
                    Text(":", style: TextStyle(
                      fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(height:  10,),
                    Text(":", style: TextStyle(
                      fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text("Fuel Leaking", style: TextStyle(
                      fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(height:  10,),
                    Text("Pudunagaram Jn", style: TextStyle(
                      fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(height:  10,),
                    Text("22/3/2024", style: TextStyle(
                      fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(height:  10,),
                    Text("11:45 AM", style: TextStyle(
                      fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(height:  10,),
                    Text("6238607474", style: TextStyle(
                      fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(),
                  ],
                ),
                   Column(
                     children: [

                     ],
                   )
                  ]
                    ),
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
              ),
      ],
    ),
    ),
      ),
    );
  }
}
