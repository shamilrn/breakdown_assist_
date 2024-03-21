import 'package:flutter/material.dart';

class User_Req_List extends StatefulWidget {
  const User_Req_List({super.key});

  @override
  State<User_Req_List> createState() => _User_Req_ListState();
}

class _User_Req_ListState extends State<User_Req_List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, index)=> Divider(thickness: 3,color: Colors.white,
        ),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index){
          return Container(
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
                    Text("Name",style: TextStyle(fontSize: 13,),),
                    Text("Date",style: TextStyle(fontSize: 13)),
                    Text("Date",style: TextStyle(fontSize: 13)),
                    Text("Fuel leaking",style: TextStyle(fontSize: 13)),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Container(
                      height: 25,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),

                      ),
                      child: Center(child: Text("Available")),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          );
        },

      ),
    );
  }
}
