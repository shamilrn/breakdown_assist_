import 'package:flutter/material.dart';

class Admin_mechanic_tab_home extends StatefulWidget {
  const Admin_mechanic_tab_home({super.key});

  @override
  State<Admin_mechanic_tab_home> createState() => _Admin_mechanic_tab_homeState();
}

class _Admin_mechanic_tab_homeState extends State<Admin_mechanic_tab_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10
        ),
        child: Card(
          child: ListView.separated(
            separatorBuilder: (context,index)=> Divider(thickness: 5,color: Colors.white,),
            itemCount: 5,
            itemBuilder: (BuildContext context,int index){
              return  Container(
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
                      backgroundImage: AssetImage("assets/image/profile.jpg"),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                        Text("Mobile number",style: TextStyle(fontSize: 12)),
                        Text("Service",style: TextStyle(fontSize: 12)),
                      ],
                    )
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
