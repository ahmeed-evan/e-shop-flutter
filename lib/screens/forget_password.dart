import 'package:e_commerce_app/controller/input_controller.dart';
import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/widgets/auth_view_widget.dart';
import 'package:e_commerce_app/widgets/custom_app_button.dart';
import 'package:e_commerce_app/widgets/custom_default_dialog.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar(context: context),
      body: Container(
        padding: marginLayout,
        child: Column(
          children: [
            _titleText(context),
            customSpacerHeight(height: 40),
            _restPasswordField(),
            customSpacerHeight(height: 40),
            _resetButtonLayout(context),
          ],
        ),
      ),
    );
  }

  _resetButtonLayout(context) {
    return AppButton(
      buttonText: AppString.text_rest_password.tr,
      onPressed: () {
        Get.find<InputController>().restPasswordController.clear();
        defaultDialog(
            context: context,
            text: AppString.text_check_your_email.tr,
            subText: AppString.text_we_have_send_recovery_password.tr);
        Future.delayed(
            const Duration(
              seconds: 2,
            ), () {
          Get.toNamed(Routes.OTP);
        });
      },
      buttonColor: AppColor.primaryColor,
      isButtonExpanded: false,
    );
  }

  _titleText(context) {
    return titleTextLayout(
        context: context,
        titleText: AppString.text_forgot_password.tr,
        subTitleText: AppString.text_enter_email_account_to_reset.tr,
        subText: AppString.text_your_pass.tr);
  }

  _restPasswordField() {
    return AppInputField(
      title: AppString.text_email_address.tr,
      hint: AppString.text_enter_email_address.tr,
      isFieldTitleHide: true,
      controller: Get.find<InputController>().restPasswordController,
      isFieldElevationHide: true,
    );
  }
}
