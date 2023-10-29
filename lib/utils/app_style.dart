import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';
import 'app_layout.dart';
import 'dimensions.dart';


// App default style here

class AppStyle {
  AppStyle._();

  static TextStyle title_text = GoogleFonts.poppins(
      fontSize: AppLayout.getWidth(Dimensions.paddingExtraLarge),
      color: Colors.white,
      fontWeight: FontWeight.w600,
      );
  static TextStyle timer_text = GoogleFonts.poppins(
      fontSize: AppLayout.getWidth(Dimensions.fontSizeDoubleLarge),
      color: Colors.white,
      fontWeight: FontWeight.w600,
      );

  static TextStyle small_text = GoogleFonts.poppins(
      fontSize: AppLayout.getWidth(Dimensions.fontSizeSmall),
      color: AppColor.cardColor,
      fontWeight: FontWeight.w500,
   );

  static TextStyle small_text_grey = GoogleFonts.poppins(
    fontSize: AppLayout.getWidth(12),
    color: Colors.grey,
    fontWeight: FontWeight.w500,
  );
  static TextStyle small_text_black = GoogleFonts.poppins(
      fontSize: AppLayout.getWidth(Dimensions.fontSizeSmall),
      color: AppColor.normalTextColor,
      fontWeight: FontWeight.w500,
      );

  static TextStyle normal_text = GoogleFonts.poppins(
      fontSize: AppLayout.getWidth(Dimensions.fontSizeDefault),
      color: Colors.white,
      fontWeight: FontWeight.w500,
      );
  static TextStyle normal_text_black = GoogleFonts.poppins(
      fontSize: Dimensions.fontSizeDefault,
      color: Colors.black,
      fontWeight: FontWeight.w500,
      );
  static TextStyle normal_text_grey = GoogleFonts.poppins(
      fontSize: AppLayout.getWidth(Dimensions.fontSizeDefault),
      color: Colors.grey,
      fontWeight: FontWeight.w600,
      );

  static TextStyle large_text = GoogleFonts.poppins(
      fontSize: AppLayout.getWidth(Dimensions.fontSizeExtraDefault),
      color: AppColor.cardColor,
      fontWeight: FontWeight.w500,
      );

  static TextStyle large_text_black = GoogleFonts.poppins(
      fontSize: AppLayout.getWidth(Dimensions.fontSizeExtraDefault),
      color: Colors.black,
      fontWeight: FontWeight.w500,
     );

  static TextStyle mid_large_text = GoogleFonts.poppins(
      fontSize: AppLayout.getWidth(Dimensions.fontSizeMid),
      color: Colors.white,
      fontWeight: FontWeight.w300,
      );

  static TextStyle extra_large_text = GoogleFonts.poppins(
      fontSize: AppLayout.getWidth(Dimensions.fontSizeLarge),
      color: Colors.white,
      fontWeight: FontWeight.w500,
      );
  static TextStyle extra_large_text_black= GoogleFonts.poppins(
      fontSize: AppLayout.getWidth(Dimensions.fontSizeLarge),
      color: Colors.black,
      fontWeight: FontWeight.w500,
     );
  static BoxDecoration ContainerStyle = BoxDecoration(
  borderRadius: BorderRadius.circular(Dimensions.radiusMid,),);

}
