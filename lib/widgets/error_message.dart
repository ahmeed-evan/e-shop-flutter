import 'package:e_commerce_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


SnackbarController errorToast({text,subtext})=> Get.snackbar(
  text,
  subtext,
  colorText: AppColor.cardColor,
  backgroundColor: AppColor.errorColor,
  icon: const Icon(Icons.done,color: AppColor.cardColor,),
);