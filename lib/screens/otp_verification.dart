import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/app_layout.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/utils/app_style.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/utils/images.dart';
import 'package:e_commerce_app/widgets/auth_view_widget.dart';
import 'package:e_commerce_app/widgets/custom_app_button.dart';
import 'package:e_commerce_app/widgets/custom_default_dialog.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar(context: context),
      body: Container(
        padding: marginLayout,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleText(context),
            customSpacerHeight(height: 36),
            _otpFieldTitle(context),

            OtpTextField(
              numberOfFields: 5,
              borderColor: AppColor.primaryColor,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              margin: const EdgeInsets.all(15),
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              onSubmit: (String verificationCode) {
                defaultDialog(context: context,text: AppString.text_thank_you.tr,subText:AppString.text_you_have.tr,widget: SizedBox(
                  height: AppLayout.getHeight(100),
                  child: Lottie.asset(Images.success),
                ));
                Future.delayed(const Duration(seconds: 2,),(){
                  Get.toNamed(Routes.MAIN);
                });
              }, // end onSubmit
            ),
            customSpacerHeight(height: 36),
           _verifyButtonLayout(context),
            customSpacerHeight(height: 12),
            _resendCodeTextLayout(context)
          ],
        ),
      ),
    );
  }

  _titleText(context) {
    return titleTextLayout(
        context: context,
        titleText: AppString.text_otp_verify.tr,
        subTitleText: AppString.text_check_you_email_to_see.tr,
        subText: AppString.text_verify_code.tr);}

  _otpFieldTitle(context) {
    return Text(AppString.text_otp_code.tr,style: AppStyle.normal_text.copyWith(color: Theme.of(context).colorScheme.onPrimary,fontSize: Dimensions.fontSizeMid+2),);
  }

  _resendCodeTextLayout(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppString.text_resend_code.tr,style: AppStyle.normal_text_black.copyWith(color: Theme.of(context).hintColor,fontWeight: FontWeight.w200),),
        Text(AppString.text_00.tr,style: AppStyle.normal_text_black.copyWith(color: Theme.of(context).hintColor,fontWeight: FontWeight.w200),),
      ],
    );
  }

  _verifyButtonLayout(BuildContext context) {
    return  AppButton(
      buttonText: AppString.text_verify.tr,
      onPressed: () {
        defaultDialog(context: context,text: AppString.text_thank_you.tr,subText: AppString.text_you_have.tr,widget: SizedBox(
          height: AppLayout.getHeight(100),
          child: Lottie.asset(Images.success),
        ));
        Future.delayed(const Duration(seconds: 2,),(){
          Get.toNamed(Routes.MAIN);
        });
      },
      buttonColor: AppColor.primaryColor,
      isButtonExpanded: false,
    );
  }
}
