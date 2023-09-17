
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dalelak/Screens/Azkar.dart';
import 'package:dalelak/Screens/Elfihres.dart';
import 'package:dalelak/Screens/speha.dart';

import 'package:dalelak/shared/ColorApp.dart';
import 'package:flutter/material.dart';
import 'hadiseScreen.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final items = const [
    Icon( FlutterIslamicIcons.tasbih, size: 30,
    color: colorApp.gold,semanticLabel: 'تسبيح '),
    Icon(FlutterIslamicIcons.kowtow, size: 30,
        color: colorApp.gold,semanticLabel: ' أذكار ',textDirection: TextDirection.ltr,),
    Icon(FlutterIslamicIcons.mohammad, size: 30,
        color:colorApp.gold,
    ),
    Icon(FlutterIslamicIcons.quran2, size: 30,
    color: colorApp.gold,)
  ];

  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (selctedIndex){
          setState(() {
            index = selctedIndex;
          });
        },
        height: 70,
        backgroundColor: Colors.transparent,

        buttonBackgroundColor: colorApp.green2,

        animationCurve: Curves.easeInOut,
        color: colorApp.green2,

        animationDuration: const Duration(milliseconds: 400),
        // animationCurve: ,
      ),
      body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    colorApp.green2,
                    colorApp.green3,
                  ])),
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: getSelectedWidget(index: index)
      ),
    );
  }

  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      case 0:
        widget =  Sepha();
        break;
      case 1:
        widget =  Azkar();
        break;
      case 2:
        widget =  Hadithe();
        break;
      default:
        widget =  Quran();
        break;

    }
    return widget;
  }
}