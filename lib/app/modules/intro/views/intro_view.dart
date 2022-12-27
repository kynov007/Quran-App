import 'dart:ui';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quran/app/constans/color.dart';
import 'package:quran/app/routes/app_pages.dart';

import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/intro.json'),
            Text(
              "Al-Quran Apps",
              style: TextStyle(
                color: Get.isDarkMode ? appWhite : appPurpleDark,
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Create by Inovasiin",
              style: TextStyle(
                color: Get.isDarkMode ? appWhite : appPurpleDark,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(Routes.HOME);
              },
              child: Text(
                "Mulai",
                style: TextStyle(
                  fontSize: 17,
                  color: Get.isDarkMode ? appPurpleDark : appWhite,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(horizontal: 70.w, vertical: 10.h),
                backgroundColor: Get.isDarkMode ? appWhite : appPurpleDark,
              ),
            )
          ],
        ),
      ),
    );
  }
}
