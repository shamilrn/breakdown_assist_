import 'package:breakdown_assist/user/tabs/user_mech_bill.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../user_mech_failed.dart';

class User_Req_List extends StatefulWidget {
  const User_Req_List({super.key});

  @override
  State<User_Req_List> createState() => _User_Req_ListState();
}

class _User_Req_ListState extends State<User_Req_List> {
  void initState() {
    super.initState();
    GetMechDetails();
  }

  var ID = '';

  Future<void> GetMechDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    ID = prefs.getString('id')!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('mechreq')
            .where('userid', isEqualTo: ID)
            .get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error:${snapshot.error}"),
            );
          }
          final mech = snapshot.data?.docs ?? [];

          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 3,
              color: Colors.white,
            ),
            itemCount: mech.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  mech[index]['payment'] == 3
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => User_Mech_Bill_Page(
                                    id: mech[index].id,
                                  )))
                      : mech[index]['payment'] == 4
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => User_Mech_Failed_Page(
                                        id: mech[index].id,
                                      )))
                          : null;
                },
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
                          Text(
                            mech[index]['mechname'],
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Text(mech[index]['date'],
                              style: TextStyle(fontSize: 13)),
                          Text(mech[index]['time'],
                              style: TextStyle(fontSize: 13)),
                          Text(mech[index]['service'],
                              style: TextStyle(fontSize: 13)),
                        ],
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          mech[index]['payment'] == 3
                              ? Container(
                                  height: 25,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "Pay",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                )
                              : mech[index]['payment'] == 4
                                  ? Container(
                                      height: 25,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "Failed",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    )
                                  : mech[index]['payment'] == 5
                                      ? Container(
                                          height: 25,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Center(
                                              child: Text(
                                            "payment Completed",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                        )
                                      : mech[index]['payment'] == 6
                                          ? Container(
                                              height: 25,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                "Response Completed",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                            )
                                          : mech[index]['status'] == 1
                                              ? Container(
                                                  height: 25,
                                                  width: 120,
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    "Approved",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                                )
                                              : mech[index]['status'] == 2
                                                  ? Container(
                                                      height: 25,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: Center(
                                                          child: Text(
                                                        "Rejected",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )),
                                                    )
                                                  : Text(''),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
