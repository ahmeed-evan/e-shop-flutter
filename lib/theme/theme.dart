import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class Themes {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColor.primaryColor,
    backgroundColor: const Color(0xffF7F7F9),
    cardColor: AppColor.cardColor,
    dividerColor: Colors.grey.shade300,
    disabledColor: const Color(0xFF343636),
    errorColor: const Color(0xFFE84D4F),
    hintColor: const Color(0xFF9F9F9F),
    focusColor: const Color(0xffd4d5d5),
    bottomAppBarColor:AppColor.primaryColor ,
    colorScheme: const ColorScheme.light(
      onPrimary: AppColor.normalTextColor,
        secondary: AppColor.cardColor
    ),
  );




  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF343636),
    backgroundColor: AppColor.darkColor,
    bottomAppBarColor:Colors.white12 ,

    cardColor: Colors.black,
    dividerColor: Colors.black,
    hintColor: const Color(0xFFbebebe),
    focusColor: const Color(0xFF9F9F9F),
    disabledColor: const Color(0xFF343636),
    errorColor: const Color(0xFFdd3135),
    colorScheme: const ColorScheme.dark(
      onPrimary: AppColor.cardColor,
      secondary: Colors.black26
    ),

  );
}
