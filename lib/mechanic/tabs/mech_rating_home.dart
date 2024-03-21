import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating_ extends StatefulWidget {
  const Rating_({super.key});

  @override
  State<Rating_> createState() => _Rating_State();
}

class _Rating_State extends State<Rating_> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rating", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: ListView.separated(
          separatorBuilder: (context, index)=> Divider(thickness: 3,color: Colors.white,
          ),
          itemCount: 1,
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
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/image/profile.jpg"),
                      ),
                      Text("Name",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text("Fuel leaking",style: TextStyle(fontSize: 13)),
                      Text("Date",style: TextStyle(fontSize: 13)),
                      Text("Time",style: TextStyle(fontSize: 13)),
                      Text("Place",style: TextStyle(fontSize: 13)),
                    ],
                  ),
                  Spacer(),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("Rating", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                     ),
                     SizedBox(
                       height: 5,
                     ),
                     RatingBar.builder(
                       itemSize: 20,
                       minRating: 0.5,
                       direction: Axis.horizontal,
                       allowHalfRating: true,
                       itemCount: 5,
                       itemBuilder: (context, _)=>Icon(Icons.star, color: Colors.amber,
                       ),
                       onRatingUpdate: (rating)=> setState(() {
                         this.rating = rating;
                       }
                       ),
                     ),
                     SizedBox(
                       height: 5,
                     ),
                     Text('$rating')
                   ],
                 ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            );
        },
      ),
    );
  }
}
