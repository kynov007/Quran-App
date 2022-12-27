import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const appGreen = Color.fromARGB(255, 142, 93, 20);
const appGreenLight1 = Color.fromARGB(255, 242, 161, 69);
const appGreenLight2 = Color.fromARGB(255, 255, 209, 156);
const appWhite = Color(0xfffaf8fc);
const appOrange = Color(0xffe6704a);

const appPurpleDark = Color(0xff1e0771);

const appPurple = Color(0xFF431AA1);

const appPurpleLight1 = Color(0xFF9345F2);
const appPurpleLight2 = Color(0xFFB9A2D8);

ThemeData themeLight = ThemeData(
  brightness: Brightness.light,
  primaryColor: appGreenLight1,
  scaffoldBackgroundColor: appWhite,
  appBarTheme: AppBarTheme(
    backgroundColor: appGreen,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(color: appGreen),
    bodyText2: TextStyle(color: appGreen),
  ),
  listTileTheme: ListTileThemeData(
    textColor: appOrange,
  ),
  tabBarTheme: TabBarTheme(
    labelColor: appWhite,
  ),
);

ThemeData themeDark = ThemeData(
  tabBarTheme: TabBarTheme(
    labelColor: appWhite,
  ),
  brightness: Brightness.dark,
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: appWhite),
  primaryColor: appPurpleLight2,
  scaffoldBackgroundColor: appPurpleDark,
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: appPurpleDark,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: appWhite,
    ),
    bodyText2: TextStyle(
      color: appWhite,
    ),
  ),
  listTileTheme: ListTileThemeData(
    textColor: appWhite,
  ),
);
