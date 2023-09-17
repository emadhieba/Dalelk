
import 'package:dalelak/Screens/Azkar_read.dart';
import 'package:dalelak/model/Azkar_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:dalelak/shared/ColorApp.dart';

class Azkar extends StatefulWidget {
  const Azkar({Key? key}) : super(key: key);

  @override
  _AzkarState createState() => _AzkarState();
}

class _AzkarState extends State<Azkar> {
  List<SectionModel> sections = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorApp.green2,
        foregroundColor: colorApp.gold,
        title: Center(child: Text("أذكار المسلم")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildSectionItem(model: sections[index]),
          itemCount: sections.length,
        ),
      ),
    );
  }

  Widget buildSectionItem({required SectionModel model}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SectionDetailScreen(id: model.id!,title: model.name!,)));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 12.0),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  colorApp.green2,
                  colorApp.green3,
                ])),
        child: Center(
            child: Text(
              "${model.name}",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: colorApp.gold,
              ),
            )),
      ),
    );
  }

  loadSections() async {
    DefaultAssetBundle.of(context)
        .loadString("assuts/sections_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        SectionModel _section = SectionModel.fromJson(section);
        sections.add(_section);
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}