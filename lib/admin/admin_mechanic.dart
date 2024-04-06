import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Admin_Mechanic extends StatefulWidget {
  const Admin_Mechanic({super.key, required this.id});
  final id;

  @override
  State<Admin_Mechanic> createState() => _Admin_MechanicState();
}

class _Admin_MechanicState extends State<Admin_Mechanic> {
  late DocumentSnapshot mech;

  getData() async {
    mech = await FirebaseFirestore.instance
        .collection('mech sign in')
        .doc(widget.id)
        .get();
  }

  void accept(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('mech sign in')
          .doc(id)
          .update({'status': 1});
    });
  }

  void reject(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('mech sign in')
          .doc(id)
          .update({'status': 1});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
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
                  Container(
                    height: 150,
                    width: 150,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(mech['path']),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    mech['username'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Location",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: mech['phone num'],
                        // labelText: "Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(style: BorderStyle.solid),
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
                        hintText: mech['workshop'],
                        // labelText: "Phone Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(style: BorderStyle.solid),
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
                        hintText: mech['work exp'],
                        // labelText: "e-mail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(style: BorderStyle.solid),
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
                        hintText: mech['email'],
                        //labelText: "Work Experience",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(style: BorderStyle.solid),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //       hintText: "Enter Your Workshop Name",
                  //       labelText: "Workshop Name",
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(15),
                  //         borderSide: BorderSide(
                  //             style: BorderStyle.solid
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 12,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //       hintText: "Enter Your Location",
                  //       labelText: "Your Location",
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(15),
                  //         borderSide: BorderSide(
                  //             style: BorderStyle.solid
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 40,
                  ),
                  mech['status'] == 0
                      ? Row(
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
                                reject(widget.id);
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
                        )
                      : mech['status'] == 1
                          ? Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                              ),
                              child: Center(child: Text("Accepted")),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                              ),
                              child: Center(child: Text("Rejected")),
                            )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
