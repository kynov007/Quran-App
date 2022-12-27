import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:quran/app/constans/color.dart';
import 'package:quran/app/data/models/juz.dart' as juz;
import 'package:quran/app/routes/app_pages.dart';

import '../../../data/models/surah.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Al Quran'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Assalamualaikum",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Obx(() {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    gradient: LinearGradient(
                      colors: (HomeController.isdark.isTrue
                          ? [appPurpleLight2, appPurpleLight1]
                          : [appGreenLight2, appGreenLight1]),
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: appWhite,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      onTap: () {
                        Get.toNamed(Routes.LAST_READ);
                      },
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: -70,
                              right: -30,
                              child: Opacity(
                                opacity: 0.4,
                                child: Container(
                                  width: 250.w,
                                  height: 250.h,
                                  child: Image.asset('assets/quran.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Obx(() {
                                        return Icon(
                                          Icons.menu_book_rounded,
                                          color: HomeController.isdark.isTrue
                                              ? appWhite
                                              : appGreen,
                                          size: 30,
                                        );
                                      }),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        "Terakhir di baca",
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    "Al Fatihah",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text("Juz 1 | Ayat 5"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(
                height: 20.h,
              ),
              TabBar(
                labelColor: Get.isDarkMode ? appWhite : appGreen,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Get.isDarkMode ? appWhite : appGreen,
                tabs: [
                  Tab(
                    text: 'Surah',
                  ),
                  Tab(
                    text: 'Juz',
                  ),
                  Tab(
                    text: 'Bookmark',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    FutureBuilder<List<Surah>>(
                      future: controller.getAllsurah(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(color: appGreen),
                          );
                        }

                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              // ignore: unused_local_variable
                              Surah surah = snapshot.data![index];
                              return ListTile(
                                onTap: () {
                                  Get.toNamed(
                                    Routes.DETAIL_SURAH,
                                    arguments: surah,
                                  );
                                },
                                //untuk widget paling kiri
                                leading: Obx(
                                  () => Container(
                                    height: 35.h,
                                    width: 35.w,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: AssetImage(
                                            HomeController.isdark.isTrue
                                                ? 'assets/list_dark.png'
                                                : 'assets/hexagon.png'),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text("${surah.number}"),
                                    ),
                                  ),
                                ),
                                //untuk widget judul
                                title: Text(
                                  "${surah.name!.transliteration!.id}",
                                ),
                                //untuk widget subjudul
                                subtitle: Text(
                                  "Ayat ${surah.numberOfVerses} | ${surah.revelation!.id}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                //widget paling kanan
                                trailing: Text(
                                  "${surah.name!.translation!.id}",
                                ),
                              );
                            });
                      },
                    ),
                    FutureBuilder<List<juz.Juz>>(
                      future: controller.getAllJuz(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(color: appGreen),
                          );
                        }
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            juz.Juz detailJuz = snapshot.data![index];
                            return ListTile(
                              onTap: () {},
                              //untuk widget paling kiri
                              leading: Obx(
                                () => Container(
                                  height: 35.h,
                                  width: 35.w,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                          HomeController.isdark.isTrue
                                              ? 'assets/list_dark.png'
                                              : 'assets/hexagon.png'),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text("${index + 1}"),
                                  ),
                                ),
                              ),
                              //untuk widget judul
                              title: Text(
                                "Juz ${index + 1} ",
                              ),
                              subtitle: Text(
                                "${detailJuz.juzStartInfo} - ${detailJuz.juzEndInfo} ",
                              ),
                              //untuk widget subjudul
                            );
                            ;
                          },
                        );
                      },
                    ),
                    Center(
                      child: Text("Bookmark"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Obx(
          () => Icon(
            Icons.color_lens,
            color: HomeController.isdark.isTrue ? appPurpleDark : appWhite,
          ),
        ),
        onPressed: () {
          HomeController.isdark.toggle();
          Get.isDarkMode
              ? Get.changeTheme(themeLight)
              : Get.changeTheme(themeDark);
        },
      ),
    );
  }
}
