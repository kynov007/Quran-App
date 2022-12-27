import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:quran/app/constans/color.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(374, 812),
      builder: (context, child) {
        return GetMaterialApp(
          theme: themeLight,
          darkTheme: themeDark,
          title: "Application",
          initialRoute: Routes.HOME,
          getPages: AppPages.routes,
        );
      },
    ),
  );
}
