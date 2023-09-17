import 'package:dalelak/shared/TextApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dalelak/shared/ColorApp.dart';
class NetworkingPageContent extends StatefulWidget {
  final String data;


  NetworkingPageContent({required this.data});

  @override
  _NetworkingPageContentState createState() => _NetworkingPageContentState();
}

class _NetworkingPageContentState extends State<NetworkingPageContent> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(

        children: [
          Column(
            children: [
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(""),

                ],
              ),
              Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextApp.topHomeScreen,

                  TextApp.headerHomeScreen,
                  SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5,right: 5),
            child: Container(

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.black12,
                          Colors.white10,
                        ])),

                child: _convertHadith(context, widget.data)),
          ),
        ],
      ),
    );
  }
}

RichText _convertHadith(BuildContext context, String text) {
  text = text.replaceAll('(', '{');
  text = text.replaceAll(')', '}');

  List<String> split = text.split(RegExp("{"));

  List<String> hadiths = split.getRange(1, split.length).fold([], (t, e) {
    var texts = e.split("}");

    if (texts.length > 1) {
      return List.from(t)
        ..addAll(
            ["{${texts.first}}", "${e.substring(texts.first.length + 1)}"]);
    }
    return List.from(t)..add("{${texts.first}");
  });

  return RichText(
    selectionColor: Colors.lightBlue,
    textAlign: TextAlign.right,
    text: TextSpan(
      style: TextStyle(fontSize: 20, color: Colors.black87),
      //style: DefaultTextStyle.of(context).style,
      children: [TextSpan(text: split.first)]..addAll(hadiths
          .map((text) => text.contains("{")
          ? TextSpan(text: text, style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold))
          : TextSpan(text: text))
          .toList()),
    ),
    textDirection: TextDirection.rtl,
  );
}