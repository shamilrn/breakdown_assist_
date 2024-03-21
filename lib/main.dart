import 'package:breakdown_assist/firebase_options.dart';
import 'package:breakdown_assist/splashscrn.dart';
import 'package:breakdown_assist/user/user_payment.dart';
import 'package:breakdown_assist/user/user_signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: User_Payment_page(),
    );
  }
}
