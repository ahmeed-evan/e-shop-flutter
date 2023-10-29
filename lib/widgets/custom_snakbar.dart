import 'package:e_commerce_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


SnackbarController showToast({context,text,subtext})=> Get.snackbar(
  text,
  subtext,
  colorText: Theme.of(context).cardColor,
  backgroundColor: AppColor.primaryColor,
  icon: const Icon(Icons.done,color: AppColor.cardColor,),
  );