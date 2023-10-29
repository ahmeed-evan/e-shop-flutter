import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:get/get.dart';


class SplashController extends GetxController {
  @override
  void onReady() {
    _swapLogo();
    _logoLayout();
    Future.delayed(const Duration(milliseconds: 900), ()=>chooseScreen());
    super.onReady();
  }

  RxInt width = 250.obs;
  RxInt height = 250.obs;
  RxBool status = false.obs;

  _swapLogo() {
    status.value = true;
  }
  _logoLayout() {
    width = 40.obs;
    height = 40.obs;
  }

  Future chooseScreen() async {
   await Get.toNamed(Routes.ONBOARD_SCREEN);
  }
}