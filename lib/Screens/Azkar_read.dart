
import 'package:dalelak/model/Azkar_detil.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dalelak/shared/ColorApp.dart';

class SectionDetailScreen extends StatefulWidget {
  final int id;
  final String title;
  const SectionDetailScreen({Key? key , required this.id , required this.title}) : super(key: key);

  @override
  _SectionDetailScreenState createState() => _SectionDetailScreenState();
}

class _SectionDetailScreenState extends State<SectionDetailScreen> {

  List<SectionDetailModel> sectionDetails = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSectionDetail();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorApp.green2,
        foregroundColor: colorApp.gold,
        title: Text("${widget.title}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(

            physics: BouncingScrollPhysics(),
            itemBuilder: (context , index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(

                  decoration: BoxDecoration(
                      color: Colors.white,

                      boxShadow: [
                        BoxShadow(
                          color:Colors.grey.withOpacity(.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0 , 3),
                          blurStyle: BlurStyle.inner,

                        )
                      ]
                  ),
                  child: Center(
                    child: ListTile(
                      title: Text("${sectionDetails[index].reference}", textDirection: TextDirection.rtl,style: TextStyle(
                          fontSize: 25,
                        color: Colors.black87
                      ),),
                      textColor: colorApp.green2,


                      subtitle: Text("${sectionDetails[index].content}" , textDirection: TextDirection.rtl,style: TextStyle(
                          fontSize: 25
                      ),),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context , index) => Divider(height: 1,color: colorApp.green2.withOpacity(.8),),
            itemCount: sectionDetails.length
        ),
      ),
    );
  }

  loadSectionDetail() async {
    sectionDetails = [];
    DefaultAssetBundle.of(context)
        .loadString("assuts/section_details_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        SectionDetailModel _sectionDetail = SectionDetailModel.fromJson(section);

        if(_sectionDetail.sectionId == widget.id) {
          sectionDetails.add(_sectionDetail);
        }

      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }

}