import 'package:breakdown_assist/firebase_options.dart';
import 'package:breakdown_assist/splashscrn.dart';
import 'package:breakdown_assist/user/tabs/user_mech_list.dart';
import 'package:breakdown_assist/user/user_login.dart';
import 'package:breakdown_assist/user/user_payment.dart';
import 'package:breakdown_assist/user/user_signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'admin/admin_add_notification.dart';
import 'admin/admin_homeuser.dart';
import 'mechanic/mech_login.dart';
import 'mechanic/mech_signup.dart';
import 'mechanic/mech_status_completed.dart';

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
      home: Mech_login(),
    );
  }
}
