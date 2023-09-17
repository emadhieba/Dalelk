import 'package:dalelak/db/Ahadis_data.dart';
import 'package:dalelak/model/hadis_model.dart';
import 'package:dalelak/model/home_hadise.dart';
import 'package:dalelak/shared/ColorApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hadithe extends StatelessWidget {
  const Hadithe({Key? key}) : super(key: key);

  Widget ayah(String key, name) {
    return Stack(
      alignment: Alignment.center,
      children: [

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(key,style: TextStyle(fontSize: 16,color: colorApp.gold),),
            Text(name,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: colorApp.gold),textScaleFactor: .5,),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [

          Expanded(
            child: Container(
              width: 10000,
              decoration:const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assuts/images/3.jpg'),
                  fit: BoxFit.cover,
                ),
              ) ,
              child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.0,
                ),
              Text("ألاربعون النوويه",textDirection: TextDirection.rtl
              ,style: TextStyle(color: colorApp.gold,fontWeight: FontWeight.bold,fontSize: 30,),),
      SizedBox(
        height: 5.0,
      ),
      Text("لحفظ وسماع الاحاديث النوويه"
        ,style: TextStyle(color: colorApp.gold,fontWeight: FontWeight.bold,fontSize: 25),),
              ],
          ),
            ),
flex: 1,
          ),
          Expanded(child:  Stack  (
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(

                  //we call the method, which is in the folder db file database.dart
                    future: Mydata.getAlldata(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(

                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            Hadith item = snapshot.data[index];
                            //delete one register for id
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          colorApp.green2,
                                          colorApp.green2,

                                        ])),

                                child: GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeHadith(hadith: item,)));
                                    },
                                    child: ayah(item.key, item.nameHadith)),
                              ),
                            );
                          },
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            mainAxisSpacing: 20,
                            childAspectRatio: 1,),

                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ],
          ),flex: 3,),
        ],

      ),
    );
  }
}
