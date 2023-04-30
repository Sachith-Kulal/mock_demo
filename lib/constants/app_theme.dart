
import 'package:flutter/material.dart';
import 'package:test_demo/constants/color_constant.dart';

class AppTheme{
  final ThemeData themeDataCustom = ThemeData(


    // primarySwatch: Colors.blue,
    canvasColor: Colors.white.withOpacity(1),
    backgroundColor: Colors.white.withOpacity(1),
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontSize: 16, color: ColorConstant.blackColor),
      bodyText2: TextStyle(fontSize: 14, color: ColorConstant.blackColor),
      headline1: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: ColorConstant.blackColor),
      headline2: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: ColorConstant.blackColor),
      headline3: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: ColorConstant.blackColor),
      headline4: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: ColorConstant.blackColor),
      headline5: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: ColorConstant.blackColor),
      headline6: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: ColorConstant.blackColor),
      subtitle1: TextStyle(fontSize: 16, color: ColorConstant.blackColor,),
      subtitle2: TextStyle(fontSize: 14, color: ColorConstant.blackColor),
      button: TextStyle(fontSize: 16, color: ColorConstant.blackColor, fontWeight: FontWeight.bold),
      caption: TextStyle(fontSize: 12, color: ColorConstant.blackColor),
      overline: TextStyle(fontSize: 10, color: ColorConstant.blackColor),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.white.withOpacity(1),
      elevation: 0,
      toolbarTextStyle: const TextStyle(color: ColorConstant.blackColor),
      titleTextStyle: const TextStyle(color: ColorConstant.blackColor,fontSize: 20,fontWeight: FontWeight.bold),
    ),
    fontFamily: 'Roboto',
  );

}