import 'package:breakdown_assist/user/user_login.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void initState(){
    super.initState();
    Tohome();
  }
  Tohome()async{
    await Future.delayed(Duration(seconds: 4),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>User_logIn())
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          child: Image.asset("assets/image/mechanic.jpg"),
        ),
      ),
    );
  }
}
