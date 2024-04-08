import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class User_Rating extends StatefulWidget {
  const User_Rating({super.key});

  @override
  State<User_Rating> createState() => _User_RatingState();
}

class _User_RatingState extends State<User_Rating> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text("Your Rating",style: TextStyle(fontSize: 25),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/image/profile.jpg"),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Name",style: TextStyle(fontSize: 25),),
            SizedBox(
              height: 10,
            ),
            Text("+2 Year Experience",style: TextStyle(fontSize: 20),),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white),
                color: Colors.green.shade400,
              ),
              child: Text("Available",style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
            SizedBox(
              height: 10,
            ),
            RatingBar.builder(
              itemSize: 35,
              minRating: 0.5,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) =>
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
              onRatingUpdate: (rating) =>
                  setState(() {
                    this.rating = rating;
                  }
                  ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
              child: Text("Add Rating",style: TextStyle(fontSize: 25),),
            ),
            SizedBox(
              height: 20,
            ),
            RatingBar.builder(
              itemSize: 40,
              minRating: 0.5,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) =>
                  Icon(
                    Icons.star_border_outlined,
                    color: Colors.amber,
                  ),
              onRatingUpdate: (rating) =>
                  setState(() {
                    this.rating = rating;
                  }
                  ),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(180, 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white
                ),
                onPressed: (){},
                child: Text("Submit",style: TextStyle(fontSize: 20),))
          ],
        ),
      ),
    );
  }
}
