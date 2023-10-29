import 'package:e_commerce_app/controller/input_controller.dart';
import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/app_layout.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/utils/app_style.dart';
import 'package:e_commerce_app/widgets/auth_view_widget.dart';
import 'package:e_commerce_app/widgets/custom_app_button.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<InputController>();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: marginLayout,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleTextLayout(context: context, titleText: AppString.text_hello_again.tr, subTitleText: AppString.text_file_your_or_continus.tr, subText: AppString.text_social_media.tr),

                  customSpacerHeight(height: 44),

                  userEmailField(controller.emailController),

                  customSpacerHeight(height: 18),

                  Obx(() => userPasswordField(context: context, controller: controller.passwordController)),

                  _recoveryPassword(onAction: () => Get.toNamed(Routes.FORGOT_PASSWORD), context: context),

                  customSpacerHeight(height: 30),

                  _loginButtonLayout(controller, context),

                  customSpacerHeight(height: 24),

                  signInWithGoogle(context: context, onAction: () {}),
                  customSpacerHeight(height: 76),
                  createUserAccount(context: context, firstText: AppString.text_new_user.tr, endText: AppString.text_create_account.tr,onAction: (){
                   Get.toNamed(Routes.SIGN_UP);
                  }),
                  customSpacerHeight(height: 13),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _callApi() async{
    Response res = await GetConnect()
        .post("http://10.0.2.2:5001/user/authentication/sign-in", {
      {"email": "a@gmail.com", "password": "12345"}
    });
    print(res.body);
  }

  _recoveryPassword({onAction, context}) {
    return Container(
      margin: EdgeInsets.only(top: AppLayout.getHeight(12)),
      child: GestureDetector(
        onTap: () => onAction(),
        child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              AppString.text_recovery_password.tr,
              style: AppStyle.normal_text.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.4)),
            )),
      ),
    );
  }

  _loginButtonLayout(controller, context) {
    return AppButton(
      buttonText: AppString.text_sign_in.tr,
      onPressed: () {
        controller.emailController.clear();
        controller.passwordController.clear();
        Get.toNamed(Routes.SIGN_UP);
      },
      buttonColor: AppColor.primaryColor,
      isButtonExpanded: false,
    );
  }
}

