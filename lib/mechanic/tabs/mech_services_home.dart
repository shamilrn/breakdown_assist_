import 'package:flutter/material.dart';

class Service_ extends StatefulWidget {
  const Service_({super.key});

  @override
  State<Service_> createState() => _Service_State();
}

class _Service_State extends State<Service_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),),
      appBar: AppBar(
        title: Text("Service", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: ListView.separated(
          separatorBuilder: (context, index)=> Divider(thickness: 1,color: Colors.black,
          indent: 15,
            endIndent: 15,
          ),
          itemCount: 4,
        itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple.shade50
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
                     Text("Tyre Puncture Service", style: TextStyle(fontSize: 13),
                     ),
                    Spacer(),
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            );
        },
      ),
    );
  }
}
