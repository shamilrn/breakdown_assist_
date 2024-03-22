import 'package:flutter/material.dart';

class Mech_Add_Service extends StatefulWidget {
  const Mech_Add_Service({super.key});

  @override
  State<Mech_Add_Service> createState() => _Mech_Add_ServiceState();
}

class _Mech_Add_ServiceState extends State<Mech_Add_Service> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        title: Center(
          child: Text("Add service"),
        ),
        titleTextStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
        content: Container(
          height: 200,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                        )
                    )
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: (){},
                  child: Text("Add",style: TextStyle(fontSize: 20),))
            ],
          ),
        ),
      ),

    );
  }
}


Add()=> AlertDialog(
  backgroundColor: Colors.purple.shade50,
  title: Center(
    child: Text("Add service"),
  ),
  titleTextStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black
  ),
  content: Container(
    height: 200,
    width: 300,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Colors.purple.shade50
                  )
              )
          ),
        ),
        SizedBox(
          height: 40,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
              ),
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
            ),
            onPressed: (){},
            child: Text("Add",style: TextStyle(fontSize: 20),))
      ],
    ),
  ),
);
