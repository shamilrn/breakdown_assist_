import 'package:breakdown_assist/user/user_login.dart';
import 'package:breakdown_assist/user/user_signin.dart';
import 'package:breakdown_assist/userormechpg.dart';
import 'package:flutter/material.dart';

import 'admin/admin_add_notification.dart';
import 'admin/admin_homeuser.dart';
import 'admin/admin_login.dart';
import 'admin/admin_mechanic.dart';
import 'admin/admin_user.dart';
import 'admin/tabs_admin/admin_tab_home.dart';
import 'mechanic/mech_bottom_bar_tabs.dart';
import 'mechanic/mech_edit_profile.dart';
import 'mechanic/mech_login.dart';
import 'mechanic/mech_service_acc_or_rej.dart';
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
      home: Ser_Acce_or_Reject(),
    );
  }
}
