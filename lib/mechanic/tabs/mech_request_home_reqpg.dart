import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../mech_service_acc_or_rej.dart';

class Mech_ReqPg extends StatefulWidget {
  const Mech_ReqPg({super.key});

  @override
  State<Mech_ReqPg> createState() => _Mech_ReqPgState();
}

class _Mech_ReqPgState extends State<Mech_ReqPg> {
  void initState() {
    super.initState();
    GetMechDetails();
  }

  var ID = '';

  void GetMechDetails() async {
    final _mechdetails = await SharedPreferences.getInstance();
    ID = _mechdetails.getString('id')!;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('mechreq')
            .where('mechid', isEqualTo: ID)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
          final detail = snapshot.data?.docs ?? [];

          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 2,
              color: Colors.white,
            ),
            itemCount: detail.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Ser_Acce_or_Reject(id: detail[index].id,)),
                    );
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
                            CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  AssetImage("assets/image/profile.jpg"),
                            ),
                            Text(
                              detail[index]['username'],
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
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
                            Text(detail[index]['service'], style: TextStyle(fontSize: 13)),
                            Text(detail[index]['date'], style: TextStyle(fontSize: 13)),
                            Text(detail[index]['time'], style: TextStyle(fontSize: 13)),
                            Text(detail[index]['place'], style: TextStyle(fontSize: 13)),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
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
