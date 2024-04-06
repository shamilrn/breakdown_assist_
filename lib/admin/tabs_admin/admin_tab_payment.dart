import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Payment_ extends StatefulWidget {
  const Payment_({super.key});

  @override
  State<Payment_> createState() => _Payment_State();
}

class _Payment_State extends State<Payment_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: FutureBuilder(
              future: FirebaseFirestore.instance.collection('mechreq').where('payment', isEqualTo: 5).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
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
                final details = snapshot.data?.docs ?? [];
                return ListView.builder(
                    itemCount: details.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.purple.shade50,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 5, 15, 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    details[index]['username'],
                                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                  ),
                                  Text(details[index]['date'], style: TextStyle(fontSize: 15)),
                                ],
                              ),
                              Text(details[index]['workamount'], style: TextStyle(fontSize: 15)),
                              Text(details[index]['service'], style: TextStyle(fontSize: 15)),
                              Text(details[index]['mechname'],
                                  style: TextStyle(fontSize: 15)),
                              SizedBox(
                                width: 90,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));
  }
}

