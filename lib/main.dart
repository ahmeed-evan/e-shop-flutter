import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/theme/theme.dart';
import 'package:e_commerce_app/theme/theme_service.dart';
import 'package:e_commerce_app/utils/internationalization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'init_ app.dart';

void main() async {
  await initApp();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme:Themes.light,
      darkTheme:Themes.dark,
      translations: Internationalization(),
      locale: GetStorage().read("languageCode") != null
          ? Locale(GetStorage().read("languageCode"),
          GetStorage().read("countryCode"))
          : const Locale("en", "US"),
      fallbackLocale: const Locale("en", "US"),
      themeMode: ThemeService().theme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
