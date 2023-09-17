
import 'package:dalelak/Screens/HomePage.dart';
import 'package:flutter/material.dart';

import 'Screens/splashScreen.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: " دليلك (prod by Emad Heiba)",
        debugShowCheckedModeBanner: false,
        home:  SplashScreen(),
    );
  }
}