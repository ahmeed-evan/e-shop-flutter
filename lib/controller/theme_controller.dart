import 'package:e_commerce_app/theme/theme_service.dart';
import 'package:get/get.dart';

class ToggleSwitchController extends GetxController {
  RxBool switchValue = false.obs;

  void toggleSwitch() {
    switchValue.value = !switchValue.value;
    ThemeService().switchTheme();

  }
}