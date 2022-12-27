import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran/app/constans/color.dart';
import 'package:quran/app/data/models/detail_surah.dart' as detail;
import 'package:quran/app/data/models/surah.dart';
import 'package:quran/app/modules/home/controllers/home_controller.dart';

import '../controllers/detail_surah_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class DetailSurahView extends GetView<DetailSurahController> {
  Surah surah = Get.arguments;
  DetailSurahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SURAH ${surah.name!.transliteration!.id!.toUpperCase()}'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          GestureDetector(
            onTap: () {
              Get.defaultDialog(
                  title: 'TAFSIR',
                  content: Column(
                    children: [
                      Divider(
                        color: Colors.black,
                        thickness: 5,
                      ),
                      Text(
                        "${surah.tafsir!.id.toString()}",
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  titleStyle: TextStyle(fontSize: 30));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      colors: (HomeController.isdark.isTrue
                          ? [appPurpleLight2, appPurpleLight1]
                          : [appGreenLight2, appGreenLight1]))),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "${surah.name!.transliteration!.id!.toUpperCase()}",
                      style: TextStyle(
                        color: appWhite,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "( ${surah.name!.translation!.id} )",
                      style: TextStyle(
                        color: appWhite,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${surah.numberOfVerses} Ayat | ${surah.revelation!.id}",
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(
                      height: 10.h,
                    )
                  ],
                ),
              ),
            ),
          ),
          FutureBuilder<detail.DetailSurah>(
            future: controller.getDetailSurah(surah.number.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    semanticsLabel: 'eror',
                    color: Colors.red,
                    semanticsValue: 'eror',
                  ),
                );
              }
              if (!snapshot.hasData) {
                return Center(
                  child: Text("Tidak Ada Data"),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.verses!.length,
                itemBuilder: (context, index) {
                  // ignore: unused_local_variable
                  detail.Verse ayat = snapshot.data!.verses![index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30.h),
                        decoration: BoxDecoration(
                            color: appGreenLight2.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 40.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          HomeController.isdark.isTrue
                                              ? 'assets/list_dark.png'
                                              : 'assets/hexagon.png'),
                                      fit: BoxFit.contain),
                                ),
                                child: Center(child: Text("${index + 1}")),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.bookmark_add_outlined),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.play_arrow),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "${ayat.text!.arab}",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 30.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "${ayat.text!.transliteration!.en}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Text(
                        "${ayat.translation!.id}",
                        textAlign: TextAlign.start,
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
