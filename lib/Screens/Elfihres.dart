import 'dart:convert';
import 'dart:math';
import 'package:dalelak/Screens/reading_surah.dart';
import 'package:dalelak/model/surah.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dalelak/shared/ColorApp.dart';
import 'package:quran/quran.dart' as quran;
import 'package:google_fonts/google_fonts.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  QuranState createState() => QuranState();
}

class QuranState extends State<Quran> with TickerProviderStateMixin {
  List<Surah> surahList = [];
  int selectedIndex = 0;
  bool isReverse = false;
  ScrollController _controller = ScrollController();
  @override
  void initState() {
    readJson();
    super.initState();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assuts/surah.json');
    final data = await json.decode(response);
    for (var item in data["chapters"]) {
      surahList.add(Surah.fromMap(item));
    }
    debugPrint(surahList.length.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('القرأن الكريم')),
        backgroundColor: colorApp.green2,
        foregroundColor: colorApp.gold,
        leading: Transform.rotate(
          angle: isReverse ? pi : 2 * pi,
          child: IconButton(
              icon: Icon(Icons.sort),
              onPressed: () {
                setState(() {
                  isReverse = !isReverse;
                });
              }),
        ),
      ),
      body: surahList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : chaptersList(isReverse ? surahList.reversed.toList() : surahList),
    );
  }

  Widget chaptersList(List<Surah> chapters) {
    return ListView.separated(
      
      controller: _controller,
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          foregroundColor: colorApp.gold ,
          backgroundColor: colorApp.green2,
          child: Text(chapters[index].id.toString()),
        ),
        title: Text(chapters[index].name),
        subtitle: Text(chapters[index].versesCount.toString()),
        trailing: Text(
          chapters[index].arabicName,
          style: GoogleFonts.cairo(
            fontSize: 18,
            color: colorApp.green2,
          ),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                SurahPage(surah: chapters[index]),
          ),
        ),
      ),
      separatorBuilder: (context, index) => Divider(height: 1),
      itemCount: chapters.length,
    );
  }
}