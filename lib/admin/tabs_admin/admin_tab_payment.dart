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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: 330,
          child: ListView.separated(separatorBuilder: (context,index)=> Divider(thickness: 5,color: Colors.white,),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index){
              return Container(
                height: 100,
                width: 150,
                child: Column(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text("Name", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                        Spacer(),
                        Text("11/04/2024", style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                        children:[
                          SizedBox(width: 10,),
                          Text("Rs 5400/-"),
                        ]
                    ),
                    SizedBox(height: 10,),
                    Row(
                        children:[
                          SizedBox(width: 10,),
                          Text("Service"),
                        ]
                    ),
                    SizedBox(height: 5,),
                    Row(
                        children:[
                          SizedBox(width: 10,),
                          Text("Mechanic name"),
                        ]
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

