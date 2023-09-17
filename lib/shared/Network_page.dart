import 'package:dalelak/model/hadis_model.dart';
import 'package:dalelak/shared/NetworkingPageContent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NetworkingPage extends StatelessWidget {

  final Hadith hadith;
  final String data;
  NetworkingPage( {required this.hadith,required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          NetworkingPageContent(data: data,),
        ],
      ),

    );
  }
}