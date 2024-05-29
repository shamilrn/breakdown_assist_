import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../admin_mechanic.dart';

class Admin_mechanic_tab_home extends StatefulWidget {
  const Admin_mechanic_tab_home({super.key});

  @override
  State<Admin_mechanic_tab_home> createState() =>
      _Admin_mechanic_tab_homeState();
}

class _Admin_mechanic_tab_homeState extends State<Admin_mechanic_tab_home> {
  int currentPage = 0;
  int itemsPerPage = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: FutureBuilder(
          future: FirebaseFirestore.instance.collection('mech sign in').get(),
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
            final totalItems = mech.length;
            final totalPages = (totalItems / itemsPerPage).ceil();


            return Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        thickness: 5,
                        color: Colors.white,
                      ),
                  itemCount:  (currentPage == totalPages - 1)
                      ? totalItems - (currentPage * itemsPerPage)
                      : itemsPerPage,
                  itemBuilder:  (BuildContext context, int index) {
                    final dataIndex = (currentPage * itemsPerPage) + index;
                    if (dataIndex >= totalItems) {
                      return SizedBox();
                    }
                    final mechanicData = mech[dataIndex];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Admin_Mechanic(
                                      id: mech[index].id,
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.purple.shade50,
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
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      NetworkImage(mechanicData['path']),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      mechanicData['username'],
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(mechanicData['location'],
                                        style: TextStyle(fontSize: 12)),
                                    Text(mechanicData['phone num'],
                                        style: TextStyle(fontSize: 12)),
                                    Text(mechanicData['work exp'],
                                        style: TextStyle(fontSize: 12)),
                                  ],
                                )
                              ],
                            )),
                      ),
                    );
                  }),
            );
            NumberPaginator(
              numberPages: totalPages,
              initialPage: currentPage,
              onPageChange: (int newPage) {
                setState(() {
                  currentPage = newPage;
                });
              },
            ),
          }),
    ));
  }
}
