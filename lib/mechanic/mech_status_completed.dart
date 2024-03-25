import 'package:flutter/material.dart';

class Mech_Status_Completed extends StatefulWidget {
  const Mech_Status_Completed({super.key});

  @override
  State<Mech_Status_Completed> createState() => _Mech_Status_CompletedState();
}

class _Mech_Status_CompletedState extends State<Mech_Status_Completed> {
  int _value = 1;
  var a,b,c;
  var amount = TextEditingController();
  var reject = TextEditingController();
  String gender ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 150,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage:AssetImage("Assets/profile img.png"),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Name",style: TextStyle(fontSize: 20),),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Fuel Leaking",style: TextStyle(fontSize: 17),),
                          Text("Date",style: TextStyle(fontSize: 17),),
                          Text("Time",style: TextStyle(fontSize: 17),),
                          Text("Place",style: TextStyle(fontSize: 17),),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
                  child: Text("Add status",style: TextStyle(fontSize: 25),),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 150,
                  width: double.infinity,
                  child: Column(children: [
                    RadioListTile(
                        activeColor: Colors.blue,
                        title: Text(
                          "Completed",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w900),
                        ),
                        value: "b",
                        groupValue: gender,
                        onChanged: (value) {
                          if (value == "b") {
                            a = 1;
                          }
                          setState(() {
                            print(value);
                            gender = value.toString();
                          });
                        }),
                    RadioListTile(
                        activeColor: Colors.blue,
                        title: Text("Not completed",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w900)),
                        value: "f",
                        groupValue: gender,
                        onChanged: (value) {
                          print(value);
                          if (value == "f") {
                            a = 2;
                          }
                          gender = value.toString();
                          setState(() {});
                        }),
                  ]),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: a==1?Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 225, 0),
                        child: Text("Amount",style: TextStyle(fontSize: 25)),
                      ),
                      SizedBox(
                        height:20 ,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 90
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              prefixIcon: Icon(Icons.currency_rupee)
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      ElevatedButton(
                          style:ElevatedButton.styleFrom(
                            fixedSize: Size(170,30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)
                            ),
                            backgroundColor: Colors.purple,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: (){},
                          child: Text("Submit",style: TextStyle(fontSize: 20),
                          ),
                      ),
                    ],
                  ):a==2? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 175, 0),
                        child: Text("Reject reason",style: TextStyle(fontSize: 25)),
                      ),
                      SizedBox(
                        height:20 ,
                      ),
                      Container(
                        height: 150,
                        width: 300,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius:BorderRadius.circular(10)
                        ),
                        child: TextFormField(
                          maxLines: 5,
                          decoration: InputDecoration(
                              border: InputBorder.none
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          style:ElevatedButton.styleFrom(
                            fixedSize: Size(170,30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)
                            ),
                            backgroundColor: Colors.purple,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: (){},
                          child: Text("Submit",style: TextStyle(fontSize: 20),))
                    ],
                  ): Text("Choose an option"),
                ),
              ],
            ),
          ),
        )
    );
  }
}
