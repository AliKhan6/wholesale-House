import 'package:flutter/material.dart';
import 'package:resellapp/constants/colors.dart';
import 'package:resellapp/ui/screens/account_screen.dart';
import 'package:resellapp/ui/screens/account_screen/profile_details_screen.dart';
import 'package:resellapp/ui/screens/account_screen/profile_info_screen.dart';
import 'package:resellapp/ui/screens/collection_screen.dart';
import 'package:resellapp/ui/screens/favourite_screen.dart';
import 'package:resellapp/ui/screens/for_you_screen.dart';
import 'package:resellapp/ui/screens/help_screen.dart';
import 'package:resellapp/ui/screens/orders_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cursorColor: pinkColor,
        primarySwatch: Colors.pink,
        accentColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      title: 'resell app',
      home: ForYouScreen(),
    );
  }
}


