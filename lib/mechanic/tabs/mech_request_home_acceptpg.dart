import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../mech_status_completed.dart';

class Mech_AcceptPg extends StatefulWidget {
  const Mech_AcceptPg({super.key});

  @override
  State<Mech_AcceptPg> createState() => _Mech_AcceptPgState();
}

class _Mech_AcceptPgState extends State<Mech_AcceptPg> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('mechreq').where('status', isEqualTo: 1).get(),
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

          return  ListView.separated(
            separatorBuilder: (context, index)=> Divider(thickness: 5, color: Colors.white,
            ),
            itemCount: detail.length,
            itemBuilder: (BuildContext context, int index){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Mech_Status_Completed(id: detail[index].id,))
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50
                  ),
                  height: 130,
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 12, 0, 0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage("assets/image/profile.jpg"),
                            ),
                            Text(detail[index]['username'],style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Text(detail[index]['service'],style: TextStyle(fontSize: 13)),
                          Text(detail[index]['date'],style: TextStyle(fontSize: 13)),
                          Text(detail[index]['time'],style: TextStyle(fontSize: 13)),
                          Text(detail[index]['place'],style: TextStyle(fontSize: 13)),
                        ],
                      ),
                      Spacer(),
                      detail[index]["payment"]==3 ?Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)
                        ),

                        child: Center(child: Text("Payment Pending", style: TextStyle(fontSize: 10, color: Colors.white), )),
                      ):detail[index]["payment"]==4 ? Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)
                        ),

                        child: Center(child: Text("Payment Success", style: TextStyle(fontSize: 10, color: Colors.white), )),
                      ): Text(''),
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
