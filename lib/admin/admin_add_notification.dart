import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Admin_Add_Notification extends StatefulWidget {
  const Admin_Add_Notification({super.key});

  @override
  State<Admin_Add_Notification> createState() => _Admin_Add_NotificationState();
}

class _Admin_Add_NotificationState extends State<Admin_Add_Notification> {
  var matter = TextEditingController();
  var content = TextEditingController();
  final date = new DateTime.now();
  TimeOfDay time =TimeOfDay.now();
  Future<dynamic> notification()async{
    await FirebaseFirestore.instance.collection('notofications').add({
      "matter": matter.text,
      "date": DateFormat('dd/mm/yy').format(date),
      "content": content.text,
      "time": time.format(context),

    }).then((value){
      Navigator.pop(context);
    });
    matter.clear();
    content.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0,5, 150,0),
            child: Text("Enter Matter :", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30,5,30,0),
            child: TextFormField(
              controller: matter,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                hintText: "Matter",
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,5, 150,0),
            child: Text("Enter Contect :", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Container(
            height: 200,
            width: 330,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,5, 0,0),
              child: TextFormField(
                controller: content,
                maxLines: 5,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Content...",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            width: 200,
            child: ElevatedButton(onPressed: (){
              notification();
            },
              style: ElevatedButton.styleFrom(
                shape: ContinuousRectangleBorder(
                    side: BorderSide(color: Colors.purple)
                ),
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                elevation: 30,
              ),
              child: Text("SUBMIT", style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
