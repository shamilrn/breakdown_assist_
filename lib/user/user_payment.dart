import 'package:flutter/material.dart';

class User_Payment_page extends StatefulWidget {
  const User_Payment_page({super.key});

  @override
  State<User_Payment_page> createState() => _User_Payment_pageState();
}

class _User_Payment_pageState extends State<User_Payment_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                width: 150,
                height: 200,
                child: Image.asset("assets/image/tickmark.png"),
              ),
              Text("Payment Succesful", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 200,
                child: ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    shape: ContinuousRectangleBorder(
                        side: BorderSide(color: Colors.purple)
                    ),
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    elevation: 30,
                  ),
                  child: Text("Go Back To Home", style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
