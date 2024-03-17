import 'package:breakdown_assist/user/user_login.dart';
import 'package:breakdown_assist/user/user_signin.dart';
import 'package:breakdown_assist/userormechpg.dart';
import 'package:flutter/material.dart';

import 'admin/admin_login.dart';
import 'mechanic/mech_login.dart';
import 'mechanic/mech_signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserOrMech(),
    );
  }
}
