import 'package:flutter/material.dart';

abstract class TextApp {
  static const Text splashScreen=const Text("ألاربعون النوويه"
    ,style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,fontSize: 36),);

  static const Text topHomeScreen=const Text("ألاربعون النوويه",textDirection: TextDirection.rtl
    ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),);
  static const Text headerHomeScreen=const Text("لحفظ وسماع الاحاديث النوويه"
    ,style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 30),);


  static const Text bookOneScreen=const Text("ألأحاديث الاربعون");
  static const Text bookTwoScreen=const Text("ألأستماع للأحاديث");
  static const Text bookThreeScreen=const Text("ألأحاديث المحفوظه");

  // static const String kBeadsCount = 'beadsCount';
  // static const String kRoundCount = 'RoundCount';
}

