
import 'dart:async';

import 'package:dalelak/shared/ColorApp.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), ()
    {
      Navigator.of(context)

          .pushReplacement(MaterialPageRoute(builder: (_)=>HomePage()));//TODO ADD HOME SCREEN
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorApp.green2,

      body: Container(

        decoration:const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assuts/images/4.jpg'),
              fit: BoxFit.fitHeight,
                opacity: 0.50,


            ),
        ) ,
        child:Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Center(
              child: Container(

                width: 233,
                height: 232,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assuts/images/logo.png'),
                    fit: BoxFit.fill,

                  ),
                ),
              ),
            ),
           SizedBox(
             height: 35,
           ),
            const Text(
              'للأحاديث و القرآن الكريم',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFFDE1A5),
                fontSize: 32,
                fontFamily: 'Neo Sans W23',
                fontWeight: FontWeight.w500,
                height: 0.02,
                letterSpacing: 0.50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}