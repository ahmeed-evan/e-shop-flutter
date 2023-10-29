import 'package:e_commerce_app/controller/password_controller.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/app_layout.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/utils/app_style.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/widgets/custom_app_button.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

signInWithGoogle({context, onAction, text}) {
  return AppButton(
    buttonText: AppString.text_sign_in_with_google.tr,
    textColor: Theme.of(context).colorScheme.onPrimary,
    onPressed: () => onAction(),
    buttonColor: Theme.of(context).hintColor.withOpacity(0.1),
    isButtonExpanded: false,
    isTextButton: true,
  );
}

titleTextLayout({context, titleText, subTitleText, subText}) {
  return Center(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(titleText,
          style: AppStyle.title_text.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: Dimensions.fontSizeDoubleLarge)),
      customSpacerHeight(height: 6),
      _subTextLayout(context, subTitleText, subText)
    ],
  ));
}

userEmailField(controller) {
  return AppInputField(
    title: AppString.text_email_address.tr,
    hint: AppString.text_enter_email_address.tr,
    controller: controller,
    isFieldElevationHide: true,
  );
}

_subTextLayout(context, text, subtext) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
          child: Text(
        text,
        style: AppStyle.normal_text
            .copyWith(color: Theme.of(context).disabledColor.withOpacity(0.5)),
      )),
      Center(
          child: Text(
        subtext,
        style: AppStyle.normal_text
            .copyWith(color: Theme.of(context).disabledColor.withOpacity(0.5)),
      )),
    ],
  );
}

createUserAccount({context, firstText,String? endText, onAction}) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: firstText,
              style: AppStyle.mid_large_text.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: Dimensions.radiusMid)),
          TextSpan(
            text: endText?.toUpperCase(),
            style: AppStyle.mid_large_text.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: Dimensions.radiusMid- 2,
                fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()..onTap = onAction,
          ),
        ],
      ),
    ),
  );
}

userPasswordField({controller, context}) {
  return AppInputField(
      title: AppString.text_password.tr,
      hint: AppString.text_enter_password.tr,
      controller: controller,
      isFieldElevationHide: true,
      obsValue: Get.find<PasswordController>().isValue.value,
      weight: IconButton(
        onPressed: () => Get.find<PasswordController>().changeVal(),
        icon: Get.find<PasswordController>().isValue.isTrue
            ? Icon(
                Icons.visibility_off_outlined,
                color: Theme.of(context).hintColor,
              )
            : Icon(
                Icons.remove_red_eye_outlined,
                color: Theme.of(context).hintColor,
              ),
      ));
}

_backArrowButton(context) {
  return Padding(
    padding: EdgeInsets.only(left: AppLayout.getWidth(20)),
    child: GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        height: AppLayout.getHeight(40),
        width: AppLayout.getWidth(40),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).cardColor,
        ),
        child: Center(
            child: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).colorScheme.onPrimary,
          size: Dimensions.fontSizeMid - 3,
        )),
      ),
    ),
  );
}

AppBar appBar({context, text, bool argumentVal = false,Widget ?widget,isNotificationHide=false,Widget ?iconW,isLeadingHide=false,notAction}) {
  return argumentVal != true
      ? AppBar(
          leading: _backArrowButton(context),
          leadingWidth: 60,
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0)
      : AppBar(
          leading: isLeadingHide !=true?


          _backArrowButton(context):Container(),
          leadingWidth: 60,
          centerTitle: true,
          backgroundColor: Theme.of(context).backgroundColor,
          title:isNotificationHide==true?

          Text(
            text,
            style: AppStyle.normal_text_black.copyWith(fontSize: Dimensions.fontSizeMid - 2,color: Theme.of(context).colorScheme.onPrimary),
          ):
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

             const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: AppStyle.normal_text_black.copyWith(fontSize: Dimensions.fontSizeMid - 2,color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              const Spacer(),
              isNotificationHide!=true?
              widget ?? _actionIconButton(context,iconW,notAction):Container(),customSpacerWidth(width: 20),

            ],
          ),
          elevation: 0,



        );
}

_actionIconButton(context,iconW,onAction) {
  return iconW ==null?


    Stack(
    children: [

      CircleAvatar(
          backgroundColor: Theme.of(context).cardColor,
          child: IconButton(
              onPressed: onAction,
              icon: Icon(
                Icons.notifications,
                color: Theme.of(context).colorScheme.onPrimary,
              ))),
      const Positioned(
          right: 0,
          child: Icon(
            Icons.circle,
            color: AppColor.errorColor,
            size: 11,
          ))
    ],
  ): CircleAvatar(
      backgroundColor: Theme.of(context).cardColor,
      child: iconW);
}

EdgeInsets get marginLayout {
  return EdgeInsets.only(
      left: AppLayout.getHeight(20), right: AppLayout.getWidth(20));
}
