import 'package:e_commerce_app/controller/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'controller/add_to_cart_controller.dart';
import 'controller/county_pickar_controller.dart';
import 'controller/gender_controller.dart';
import 'controller/pick_image_controller.dart';
import 'controller/splash_controller.dart';
import 'package:e_commerce_app/controller/input_controller.dart';
import 'package:e_commerce_app/controller/password_controller.dart';
import 'package:e_commerce_app/controller/theme_controller.dart';
import 'package:e_commerce_app/controller/wishList_controller.dart';


Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  Get.put(SplashController(), permanent: true);
  Get.put(ToggleSwitchController(), permanent: true);
  Get.put(WishlistController(), permanent: true);
  Get.put(PasswordController(), permanent: true);
  Get.put(InputController(), permanent: true);
  Get.put(LanguageController(), permanent: true);
  Get.put(CountryPickerController(), permanent: true);
  Get.put(AddToCartController(), permanent: true);
  Get.put(PickImageController(), permanent: true);
  Get.put(GenderController(), permanent: true);
}
