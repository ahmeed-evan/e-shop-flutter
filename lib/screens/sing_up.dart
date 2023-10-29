import 'package:e_commerce_app/controller/input_controller.dart';
import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/widgets/custom_app_button.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_color.dart';
import '../widgets/auth_view_widget.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<InputController>();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Container(
          padding: marginLayout,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  titleTextLayout(context: context, titleText: AppString.text_sign_up.tr, subTitleText: AppString.text_file_your_or_continus.tr, subText: AppString.text_social_media.tr),
                  customSpacerHeight(height: 28),

                  _userNameField(controller),
                  customSpacerHeight(height: 16),

                  userEmailField(controller.emailController),
                  customSpacerHeight(height: 16),

                  Obx(() => userPasswordField(context: context, controller: controller.passwordController)),
                  customSpacerHeight(height: 26),

                  _logUpButtonLayout(controller,context),
                  customSpacerHeight(height: 20),

                  signInWithGoogle(context: context, onAction: () {}),
                  const Spacer(),
                  createUserAccount(context: context, firstText: AppString.text_already_have_account.tr, endText: AppString.text_login.tr,onAction: (){Get.toNamed(Routes.SIGN_IN);}),
                  const Spacer(),
                  customSpacerHeight(height: 90),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  _logUpButtonLayout(controller, context) {
    return AppButton(
      buttonText: AppString.text_sign_up.tr,
      onPressed: () {
        controller.emailController.clear();
        controller.passwordController.clear();
        controller.userNameController.clear();
        Get.toNamed(Routes.MAIN);
      },
      buttonColor: AppColor.primaryColor,
      isButtonExpanded: false,
    );

  }

  _userNameField(controller) {
    return AppInputField(
      title: AppString.text_your_name.tr,
      hint: AppString.text_enter_your_name.tr,
      controller: controller.userNameController,
      isFieldElevationHide: true,
    );
  }

}
