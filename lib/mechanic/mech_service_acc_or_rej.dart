import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Ser_Acce_or_Reject extends StatefulWidget {
  const Ser_Acce_or_Reject({super.key, required this.id});
  final id;

  @override
  State<Ser_Acce_or_Reject> createState() => _Ser_Acce_or_RejectState();
}

class _Ser_Acce_or_RejectState extends State<Ser_Acce_or_Reject> {
  late DocumentSnapshot user;

  getData() async {
    user = await FirebaseFirestore.instance
        .collection("mechreq")
        .doc(widget.id)
        .get();
  }

  void accept(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection("mechreq")
          .doc(id)
          .update({'status': 1});
      print("accept");
    });
  }

  void rejects(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection("mechreq")
          .doc(id)
          .update({'status': 2});
      print("Rejected");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("Error${snapshot.error}");
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                user['userprofile'] == ''
                ? CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/image/profile.jpg"),
                ): CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/image/profile.jpg"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  user['username'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 330,
                  height: MediaQuery.of(context).size.width,
                  child: Row(children: [
                    Column(
                      children: [
                        Text(
                          "Problem",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Place",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Date",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Time",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Contact Number",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          ":",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          user['service'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          user['place'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          user['date'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          user['time'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "6238607474",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                    Column(
                      children: [],
                    )
                  ]),
                ),
                user['status']==0? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        accept(widget.id);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: ContinuousRectangleBorder(
                            side: BorderSide(color: Colors.purple)),
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                        elevation: 15,
                      ),
                      child: Text(
                        "ACCEPT",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        rejects(widget.id);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: ContinuousRectangleBorder(
                            side: BorderSide(color: Colors.red)),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        elevation: 15,
                      ),
                      child: Text(
                        "REJECT",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ): user['status']== 1?
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: ContinuousRectangleBorder(
                        side: BorderSide(color: Colors.purple)),
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    elevation: 15,
                  ),
                  child: Text(
                    "ACCEPTED",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ):
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: ContinuousRectangleBorder(
                        side: BorderSide(color: Colors.purple)),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    elevation: 15,
                  ),
                  child: Text(
                    "REJECTED",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
